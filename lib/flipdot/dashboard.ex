defmodule Flipdot.Dashboard do
  @moduledoc """
  Compose a dashboard to show on flipboard
  """
  use GenServer
  alias Flipdot.DisplayState
  alias Flipdot.Font.Renderer
  alias Flipdot.Font.Library
  alias Flipdot.Weather
  import Flipdot.PrettyDump
  require Logger

  defstruct font: nil, timer: nil, time: nil, weather: nil, bitmap: nil

  @font "flipdot"

  def start_link(_state) do
    GenServer.start_link(__MODULE__, %__MODULE__{}, name: __MODULE__)
  end

  @impl true
  def init(state) do
    font = Library.get_font_by_name(@font)

    {:ok, %{state | font: font}, {:continue, :update_dashboard}}
  end

  def start_dashboard() do
    GenServer.call(__MODULE__, :start_dashboard)
  end

  def stop_dashboard() do
    GenServer.call(__MODULE__, :stop_dashboard)
  end

  # server functions

  @impl true
  def handle_call(:start_dashboard, _, state) do
    {:ok, timer} = :timer.send_interval(250, self(), :update_dashboard)

    Logger.info("Dashboard has been started.")
    {:reply, :ok, %{state | timer: timer}}
  end

  @impl true
  def handle_call(:stop_dashboard, _, state) do
    Logger.info("Shutting down Dashboard.")

    state =
      if state.timer do
        {:ok, :cancel} = :timer.cancel(state.timer)
        Logger.info("Timer canceled.")
        %{state | timer: nil}
      else
        state
      end

    {:reply, :ok, state}
  end

  @impl true
  def handle_continue(:update_dashboard, state) do
    state = update_dashboard(state)
    {:noreply, state}
  end

  @impl true
  def handle_info(:update_dashboard, state) do
    state = update_dashboard(state)
    {:noreply, state}
  end

  # helper functions

  defp get_time_string do
    DateTime.now!("Europe/Berlin", Tz.TimeZoneDatabase)
    |> Calendar.strftime("%c", preferred_datetime: "%H:%M")
  end

  defp update_dashboard(state) do
    time_string = get_time_string()
    weather = Weather.get_weather()

    bitmap = Bitmap.new(DisplayState.width(), DisplayState.height())

    # render temperature
    temperature = Weather.get_temperature()
    # pretty_dump(temperature, "temperature")
    temp_string = :erlang.float_to_binary(temperature / 1, decimals: 1) <> "°"
    bitmap = place_text(bitmap, state.font, temp_string, :top, :left)

    # render rain
    # {rainfall_rate, rainfall_intensity} = Weather.get_rain()

    # bitmap =
    #   place_text(bitmap, state.font, "R #{rainfall_rate}  I #{rainfall_intensity}",
    #     align_vertically: :top,
    #     align_horizontally: :left
    #   )

    # render wind
    {_wind_speed, wind_force} = Weather.get_wind()

    # bitmap = place_text(bitmap, state.font, :erlang.float_to_binary(wind_speed, decimals: 1), :bottom, :left)
    bitmap = place_text(bitmap, state.font, "#{[0xF72E, ?\s]}" <> Integer.to_string(wind_force), :bottom, :left)

    # plot temperature hours

    # render time
    bitmap = place_text(bitmap, state.font, time_string, :top, :right)

    if bitmap != state.bitmap do
      DisplayState.set(bitmap)
    end

    %{state | time: time_string, weather: weather}
  end

  # TODO: Umschreiben, so dass man eine Orientierung angeben kann {:left, :right, :center}, {:top, :middle, :bottom}

  defp place_text(bitmap, font, text, align_vertically, align_horizontally) do
    rendered_text =
      Bitmap.new(1000, 1000)
      |> Renderer.render_text({10, 10}, font, text)
      |> Bitmap.clip()

    cursor_x =
      case align_horizontally do
        :left -> 0
        :center -> div(bitmap.meta.width - rendered_text.meta.width, 2)
        :right -> bitmap.meta.width - rendered_text.meta.width
      end

    cursor_y =
      case align_vertically do
        :top -> bitmap.meta.height - rendered_text.meta.height
        :middle -> div(bitmap.meta.height - rendered_text.meta.height, 2)
        :bottom -> 0
      end

    bitmap
    |> Bitmap.overlay(
      rendered_text,
      cursor_x: cursor_x,
      cursor_y: cursor_y
    )
  end
end
