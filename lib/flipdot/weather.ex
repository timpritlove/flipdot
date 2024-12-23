defmodule Flipdot.Weather do
  @moduledoc """
  Retrieve weather data on a regular basis. Uses OpenWeatherMap API which
  needs an account to access it. Pass the developer API key to the library
  via the FLIPDOT_OPENWEATHERMAP_API_KEY environment variable.
  """
  alias Phoenix.PubSub
  use GenServer

  require HTTPoison
  require Logger

  defstruct [:timer, :api_key, :latitude, :longitude, :weather]

  @latitude_env "FLIPDOT_LATITUDE"
  @longitude_env "FLIPDOT_LONGITUDE"

  @topic "weather:update"

  @openweathermap_onecall_url "https://api.openweathermap.org/data/3.0/onecall"
  @api_key_file "data/keys/openweathermap.txt"
  @api_key_env "FLIPDOT_OPENWEATHERMAP_API_KEY"

  @ip_geolocation_url "http://ip-api.com/json"

  def topic, do: @topic

  # initialization functions

  def start_link(_state) do
    case get_api_key() do
      {:ok, _api_key} ->
        GenServer.start_link(__MODULE__, %__MODULE__{}, name: __MODULE__)

      {:error, reason} ->
        Logger.warning("Weather service disabled: #{reason}")
        :ignore
    end
  end

  @impl true
  def init(state) do
    {:ok, api_key} = get_api_key()
    {latitude, longitude, source} = get_location()

    Logger.info("Weather service started using #{source} location (#{latitude}, #{longitude})")

    # update weather information in a second and then every 5 minutes
    {:ok, _} = :timer.send_after(5_000, :update_weather)
    {:ok, timer} = :timer.send_interval(300_000, :update_weather)

    {:ok, %{state | api_key: api_key, latitude: latitude, longitude: longitude, timer: timer}}
  end

  @impl true
  def terminate(_reason, state) do
    if state.timer do
      {:ok, :cancel} = :timer.cancel(state.timer)
    end

    Logger.info("Terminating weather service")
  end

  # client functions

  def update_weather(), do: GenServer.call(__MODULE__, :update_weather)

  def get_weather(), do: GenServer.call(__MODULE__, :get_weather)

  def get_current_temperature() do
    weather = get_weather()
    weather["current"]["temp"]
  end

  def get_wind_speed() do
    weather = get_weather()
    weather["current"]["wind_speed"]
  end

  def get_rain() do
    weather = get_weather()
    rainfall_rate = weather["current"]["rain"]
    rainfall_intensity = rainfall_intensity(rainfall_rate)
    {rainfall_rate, rainfall_intensity}
  end

  def get_48_hour_temperature() do
    case get_weather() do
      nil -> []
      weather when is_map(weather) ->
        case weather["hourly"] do
          nil -> []
          hourly when is_list(hourly) ->
            for {hourly_data, index} <- Enum.with_index(hourly),
                temperature = hourly_data["temp"] / 1,
                datetime = DateTime.from_unix!(hourly_data["dt"]) do
              {temperature, datetime, index}
            end
        end
    end
  end

  # server functions

  @impl true
  def handle_call(:get_weather, _, state) do
    {:reply, state.weather, state}
  end

  @impl true
  def handle_call(:update_weather, _, state) do
    {:reply, :ok, update_weather(state)}
  end

  @impl true
  def handle_info(:update_weather, state) do
    state = update_weather(state)
    {:noreply, state}
  end

  defp update_weather(state) do
    case call_openweathermap(state.api_key, state.latitude, state.longitude) do
      nil ->
        state

      weather ->
        PubSub.broadcast(Flipdot.PubSub, topic(), {:update_weather, weather})
        %{state | weather: weather}
    end
  end

  # define rainfall intensity based on rainfall intensity

  def rainfall_intensity(rainfall_rate) when rainfall_rate >= 0 do
    rainfall_rate = rainfall_rate / 1
    rainfall_intensity_scale = [0.1, 2.6, 7.6, 50.0]
    do_rainfall_intensity(rainfall_rate, 0, rainfall_intensity_scale)
  end

  defp do_rainfall_intensity(_, rainfall_level, []), do: rainfall_level

  defp do_rainfall_intensity(rainfall_rate, rainfall_intensity, [threshold | _])
       when rainfall_rate < threshold do
    rainfall_intensity
  end

  defp do_rainfall_intensity(rainfall_rate, rainfall_intensity, [_ | scale]) do
    do_rainfall_intensity(rainfall_rate, rainfall_intensity + 1, scale)
  end

  # define wind force based on beaufort scale

  def wind_force(wind_speed) when wind_speed >= 0 do
    wind_speed = wind_speed / 1
    beaufort_scale = [0.3, 1.6, 3.4, 5.5, 8.0, 10.8, 13, 9, 17.2, 20.8, 24.5, 28.5, 32.7]
    do_wind_force(wind_speed, 0, beaufort_scale)
  end

  defp do_wind_force(_, wind_force, []), do: wind_force

  defp do_wind_force(wind_speed, wind_force, [threshold | _]) when wind_speed < threshold do
    wind_force
  end

  defp do_wind_force(wind_speed, wind_force, [_ | scale]) do
    do_wind_force(wind_speed, wind_force + 1, scale)
  end

  # retrieve OWM API key from either a local config file or from the environment

  def get_api_key do
    case File.read(@api_key_file) do
      {:ok, key} ->
        {:ok, String.trim(key)}

      {:error, _} ->
        case System.get_env(@api_key_env) do
          nil -> {:error, "No API key found in file or environment"}
          key -> {:ok, key}
        end
    end
  end

  def call_openweathermap(api_key, latitude, longitude) do
    url = @openweathermap_onecall_url

    params = [
      {"lat", latitude},
      {"lon", longitude},
      {"units", "metric"},
      {"appid", api_key}
    ]

    case HTTPoison.get(url, [], params: params) do
      {:ok, %{status_code: 200, body: body}} ->
        Jason.decode!(body)

      {:ok, %{status_code: status_code}} ->
        Logger.warning("OpenWeatherMap API call failed (#{status_code})")
        nil
    end
  end

  defp get_location do
    case {System.get_env(@latitude_env), System.get_env(@longitude_env)} do
      {lat, lon} when is_binary(lat) and is_binary(lon) ->
        {String.to_float(lat), String.to_float(lon), "environment variables"}

      _ ->
        Logger.info("No location coordinates in environment, falling back to IP geolocation")
        get_location_from_ip()
    end
  end

  defp get_location_from_ip do
    case HTTPoison.get(@ip_geolocation_url) do
      {:ok, %{status_code: 200, body: body}} ->
        case Jason.decode!(body) do
          %{"lat" => lat, "lon" => lon} ->
            {lat, lon, "IP geolocation"}
          _ ->
            Logger.error("Invalid response from IP geolocation service")
            raise "Could not determine location"
        end

      {:error, reason} ->
        Logger.error("Failed to get location from IP: #{inspect(reason)}")
        raise "Could not determine location"
    end
  end
end
