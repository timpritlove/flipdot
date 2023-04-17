defmodule Flipdot.Display do
  @moduledoc """
  Store the current frame buffer of the virtual Bitmap Display. Send PubSub broadcasts
  whenever the content changes.
  """

  defstruct bitmap: nil
  use Agent

  @topic "display"

  def start_link(bitmap) do
    bitmap = if bitmap == nil, do: Bitmap.new(width(), height()), else: bitmap

    Agent.start_link(fn -> %__MODULE__{bitmap: bitmap} end, name: __MODULE__)
  end

  def topic, do: @topic

  def width, do: Application.fetch_env!(:flipdot, :display)[:width]
  def height, do: Application.fetch_env!(:flipdot, :display)[:height]

  def get do
    Agent.get(__MODULE__, fn state -> state.bitmap end)
  end

  def clear do
    Bitmap.new(width(), height()) |> set()
  end

  def set(bitmap) do
    old_bitmap = get()
    new_bitmap = Bitmap.crop_relative(bitmap, width(), height(), rel_x: :center, rel_y: :middle)

    if new_bitmap != old_bitmap do
      Phoenix.PubSub.broadcast(Flipdot.PubSub, @topic, {:display_updated, new_bitmap})
      Agent.update(__MODULE__, fn _ -> %__MODULE__{bitmap: new_bitmap} end)
    end

    bitmap
  end
end
