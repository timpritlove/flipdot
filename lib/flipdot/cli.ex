defmodule Flipdot.CLI do
  def main(args) do
    {opts, _, _} =
      OptionParser.parse(args,
        strict: [
          mode: :string,
          device: :string,
          telegram_token: :string,
          weather_token: :string,
          help: :boolean
        ],
        aliases: [
          m: :mode,
          d: :device,
          t: :telegram_token,
          w: :weather_token,
          h: :help
        ]
      )

    case opts do
      [help: true] -> print_help()
      _ -> start_application(opts)
    end
  end

  defp start_application(opts) do
    # Set environment variables from CLI options
    if mode = opts[:mode], do: System.put_env("FLIPDOT_MODE", String.upcase(mode))
    if device = opts[:device], do: System.put_env("FLIPDOT_DEVICE", device)
    if token = opts[:telegram_token], do: System.put_env("TELEGRAM_BOT_SECRET", token)
    if weather = opts[:weather_token], do: System.put_env("OPENWEATHER_API_KEY", weather)

    # Start the application
    Application.ensure_all_started(:flipdot)

    # Keep the application running
    Process.sleep(:infinity)
  end

  defp print_help do
    IO.puts """
    Flipdot Display Controller

    Usage: flipdot [options]

    Options:
      -m, --mode            Set display mode (usb|udp|dummy)
      -d, --device         Set USB device path for USB mode
      -t, --telegram-token Set Telegram bot token
      -w, --weather-token  Set OpenWeather API token
      -h, --help          Show this help message

    Environment variables:
      FLIPDOT_MODE         Same as --mode
      FLIPDOT_DEVICE       Same as --device
      TELEGRAM_BOT_SECRET  Same as --telegram-token
      OPENWEATHER_API_KEY  Same as --weather-token
    """
  end
end
