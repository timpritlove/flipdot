defmodule Flipdot.Driver do
  use GenServer
  alias Flipdot.PubSub
  alias Flipdot.Display
  require Logger

  # network mode
  @mode_env "FLIPDOT_DRIVER"
  @driver %{
    network: Flipdot.Driver.Network,
    usb: Flipdot.Driver.USB,
    dummy: Flipdot.Driver.Dummy,
    flipflapflop: Flipdot.Driver.Flipflapflop
  }

  # Default dimensions for most drivers
  @default_width 115
  @default_height 16

  defstruct mode: :dummy, driver: nil

  def start_link(_) do
    GenServer.start_link(__MODULE__, %__MODULE__{}, name: __MODULE__)
  end

  def width do
    GenServer.call(__MODULE__, :get_width)
  end

  def height do
    GenServer.call(__MODULE__, :get_height)
  end

  @impl true
  def init(state) do
    mode_string = System.get_env(@mode_env)

    mode =
      case String.downcase(mode_string || "") do
        "usb" -> :usb
        "network" -> :network
        "flipflapflop" -> :flipflapflop
        _ -> :dummy
      end

    {:ok, _} =
      DynamicSupervisor.start_link(
        strategy: :one_for_one,
        name: Flipdot.Driver.DriverSupervisor
      )

    {:ok, driver} = DynamicSupervisor.start_child(Flipdot.Driver.DriverSupervisor, @driver[mode])

    Phoenix.PubSub.subscribe(PubSub, Display.topic())
    Logger.info("Fluepdot server started (mode: #{inspect(mode)}).")

    {:ok, %{state | mode: mode, driver: driver}}
  end

  @impl true
  def handle_info({:display_updated, bitmap}, state) do
    send(state.driver, {:display_updated, bitmap})
    {:noreply, state}
  end

  @impl true
  def handle_call(:get_width, _from, state) do
    width =
      case state.mode do
        # Flipflapflop has a different width
        :flipflapflop -> 112
        _ -> @default_width
      end

    {:reply, width, state}
  end

  @impl true
  def handle_call(:get_height, _from, state) do
    {:reply, @default_height, state}
  end
end
