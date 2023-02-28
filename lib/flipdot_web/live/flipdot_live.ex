defmodule FlipdotWeb.FlipdotLive do
  use FlipdotWeb, :live_view

  alias Flipdot.ClockGenerator
  alias Flipdot.DisplayState

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(250, self(), :tick)

    Phoenix.PubSub.subscribe(Flipdot.PubSub, DisplayState.topic())

    socket =
      socket
      |> assign(page_title: "Flipdot Display")
      |> assign(:bitmap, DisplayState.get())
      |> assign(:clock, clock())

    {:ok, socket}
  end

  def handle_info({:display_update, bitmap}, socket) do
    {:noreply,
     socket
     |> assign(:bitmap, bitmap)}
  end

  def handle_info(:tick, socket) do
    {:noreply,
     socket
     |> assign(:clock, clock())}
  end

  def handle_event("start-clock", _params, socket) do
    ClockGenerator.start_generator()

    {:noreply, socket}
  end

  def handle_event("stop-clock", _params, socket) do
    ClockGenerator.stop_generator()

    {:noreply, socket}
  end

  def handle_event("random", _params, socket) do
    Bitmap.random(115, 16) |> DisplayState.set()

    {:noreply, socket}
  end

  def handle_event("game-of-life", _params, socket) do
    DisplayState.get() |> Bitmap.game_of_life() |> DisplayState.set()

    {:noreply, socket}
  end

  def handle_event("toggle", params, socket) do
    x = String.to_integer(params["x"])
    y = String.to_integer(params["y"])

    DisplayState.get()
    |> Bitmap.toggle_pixel(x, y)
    |> DisplayState.set()

    {:noreply, assign(socket, :bitmap, DisplayState.get())}
  end

  def clock do
    DateTime.now!("Europe/Berlin", Tz.TimeZoneDatabase)
    |> Calendar.strftime("%c", preferred_datetime: "%d.%m.%Y %H:%M:%S")
  end
end
