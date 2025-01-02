defmodule Fliplove.Apps.Datetime do
  @moduledoc """
  Shows current time and date on the flipboard
  """
  use Fliplove.Apps.Base
  alias Fliplove.{Display, Bitmap}
  alias Fliplove.Font.{Library, Renderer}
  alias Fliplove.TimezoneHelper
  require Logger

  defstruct font: nil

  @font "flipdot"

  def init_app(_opts) do
    state = %__MODULE__{
      font: Library.get_font_by_name(@font)
    }
    update_display(state)
    schedule_next_minute()
    {:ok, state}
  end

  # server functions

  @impl true
  def terminate(_reason, _state) do
    Logger.info("Datetime app has been shut down.")
  end

  @impl true
  def handle_info(:update, state) do
    update_display(state)
    schedule_next_minute()
    {:noreply, state}
  end

  defp update_display(%{font: font}) do
    now = DateTime.now!(TimezoneHelper.get_system_timezone(), Tz.TimeZoneDatabase)

    Bitmap.new(Display.width(), Display.height())
    |> place_text(font, format_time(now), :top, :left)
    |> place_text(font, format_week(now), :top, :right)
    |> place_text(font, format_date(now), :bottom, :center)
    |> Display.set()
  end

  defp schedule_next_minute do
    now = System.system_time(:millisecond)
    next_minute = div(now, 60_000) * 60_000 + 60_000
    remaining_time = next_minute - now
    :timer.send_after(remaining_time, __MODULE__, :update)
  end

  defp format_time(datetime) do
    Calendar.strftime(datetime, "%H:%M")
  end

  defp format_date(datetime) do
    Calendar.strftime(datetime, "%d.%m.%Y")
  end

  defp format_week(datetime) do
    week = get_iso_week(datetime)
    # Remove leading zero for display
    week_num = String.trim_leading(week, "0")
    "KW #{week_num}"
  end

  defp get_iso_week(datetime) do
    # Convert to Date for calculation
    date = DateTime.to_date(datetime)

    # Calculate the week number
    # The week 1 of a year is the week that contains January 4th
    {:ok, jan4} = Date.new(date.year, 1, 4)
    jan4_dow = Date.day_of_week(jan4)

    # Find the Monday of week 1
    week1_start = Date.add(jan4, -(jan4_dow - 1))

    # Calculate days since the start of week 1
    days_since_week1 = Date.diff(date, week1_start)

    # Calculate the week number
    week = div(days_since_week1, 7) + 1

    # Handle edge cases
    week = if week < 1 do
      # Get the last week of previous year
      {:ok, prev_dec31} = Date.new(date.year - 1, 12, 31)
      get_iso_week(DateTime.new!(prev_dec31, Time.utc_now(), datetime.time_zone))
    else
      week
    end

    # Format with leading zero
    String.pad_leading("#{week}", 2, "0")
  end

  defp place_text(bitmap, font, text, align_vertically, align_horizontally) do
    Renderer.place_text(bitmap, font, text,
      align: align_horizontally,
      valign: align_vertically
    )
  end
end
