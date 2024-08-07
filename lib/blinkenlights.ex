defmodule Blinkenlights do
  alias Blinkenlights.BLM

  # stream a Blinkenlights movie
  # each iteration creates a {ms, frame} tuple

  @doc """
  Parse a Blinkenlights Movie file and return it as a %BLM{} struct.
  """
  def parse_blm_file(path) do
    blm_file = File.read!(path)
    {:ok, [blm], _, _, _, _} = BLM.parse_blm(blm_file)
    blm
  end

  @doc """
  Open a BLM movie and return a stream of timed frames.
  """

  def blm_movie_stream(path, opts \\ []) do
    opts = Keyword.validate!(opts, loop: false)

    Stream.resource(
      fn ->
        blm = parse_blm_file(path)
        {blm.frames, blm, opts}
      end,
      fn
        {[{ms, bitmap} | frames], blm, opts} ->
          cond do
            frames == [] and opts[:loop] ->
              {[{ms, bitmap}], {blm.frames, blm, opts}}

            true ->
              {[{ms, bitmap}], {frames, blm, opts}}
          end

        {[], _, _} ->
          {:halt, nil}
      end,
      fn _ -> nil end
    )
  end

  @doc """
  Adjust the speed of a movie stream by factor.
  A factor of > 1 speeds things up, a factor < 1 slows it down.
  """
  def speed(frames, factor) when factor > 0 do
    Stream.transform(
      frames,
      nil,
      fn {ms, bitmap}, _ -> {[{round(ms / factor), bitmap}], nil} end
    )
  end
end
