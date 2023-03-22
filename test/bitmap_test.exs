defmodule BitmapTest do
  use ExUnit.Case
  doctest Bitmap

  test "create simple bitmap" do
    assert Bitmap.new(2, 2) |> inspect == "+--+\n|  |\n|  |\n+--+\n"
  end

  test "create bitmap from lines of text" do
    assert invader() |> inspect() == """
           +-----------+
           |  X     X  |
           |   X   X   |
           |  XXXXXXX  |
           | XX XXX XX |
           |XXXXXXXXXXX|
           |X XXXXXXX X|
           |X X     X X|
           |   XX XX   |
           +-----------+
           """
  end

  test "bitmap to text" do
    assert assert invader() |> Bitmap.to_text() ==
                    "  X     X  \n   X   X   \n  XXXXXXX  \n XX XXX XX \nXXXXXXXXXXX\nX XXXXXXX X\nX X     X X\n   XX XX   \n"
  end

  test "bitmap to binary" do
    assert assert invader() |> Bitmap.to_binary() == <<112, 24, 125, 182, 188, 60, 188, 182, 125, 24, 112>>
  end

  test "bitmap dimensions" do
    assert assert invader() |> Bitmap.dimensions() == {11, 8}
  end

  test "invert bitmap" do
    assert invader() |> Bitmap.invert() |> inspect() == """
           +-----------+
           |XX XXXXX XX|
           |XXX XXX XXX|
           |XX       XX|
           |X  X   X  X|
           |           |
           | X       X |
           | X XXXXX X |
           |XXX  X  XXX|
           +-----------+
           """
  end

  test "rotate bitmap" do
    assert invader() |> Bitmap.rotate() |> inspect() == """
           +--------+
           | XXX    |
           |   XX   |
           | XXXXX X|
           |X XX XX |
           |X XXXX  |
           |  XXXX  |
           |X XXXX  |
           |X XX XX |
           | XXXXX X|
           |   XX   |
           | XXX    |
           +--------+
           """
  end

  test "translate bitmap" do
    assert invader() |> Bitmap.translate({3, 5}) |> inspect() == """
           +-----------+
           |   X XXXXXX|
           |   X X     |
           |      XX XX|
           |           |
           |           |
           |           |
           |           |
           |           |
           +-----------+
           """
  end

  test "fill bitmap" do
    assert invader() |> Bitmap.fill({5, 1}) |> inspect() == """
           +-----------+
           |  X     X  |
           |   X   X   |
           |  XXXXXXX  |
           | XX XXX XX |
           |XXXXXXXXXXX|
           |X XXXXXXX X|
           |X XXXXXXX X|
           |   XXXXX   |
           +-----------+
           """
  end

  test "game of life" do
    assert invader() |> Bitmap.game_of_life() |> inspect() == """
           +-----------+
           |           |
           |     X     |
           | X       X |
           |X         X|
           |X         X|
           |X         X|
           |  X     X  |
           |   X   X   |
           +-----------+
           """
  end

  def invader do
    Bitmap.from_lines_of_text([
      "  X     X  ",
      "   X   X   ",
      "  XXXXXXX  ",
      " XX XXX XX ",
      "XXXXXXXXXXX",
      "X XXXXXXX X",
      "X X     X X",
      "   XX XX   "
    ])
  end
end
