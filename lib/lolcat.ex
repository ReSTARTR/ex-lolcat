defmodule Lolcat do
  def main(_args \\ []) do
    :random.seed
    os = :quickrand.uniform(256)
    puts(os)
  end

  def puts(os \\ 0) do
    IO.stream(:stdio, :line)
    |> Stream.with_index
    |> Enum.map(fn({s, j}) -> format(s, j + os) end)
    |> IO.puts
  end

  def colorize({c, i}, os, freq) do
    rgb = rainbow(freq, os + i/8.0)
    Colorful.string(to_string([c]), rgb)
  end

  def format(string, os \\ 0, freq \\ 0.3) do
    string
    |> to_char_list
    |> Enum.with_index
    |> Enum.map(&(colorize(&1, os, freq)))
    |> Enum.join
  end

  # ref: https://github.com/busyloop/lolcat/blob/master/lib/lolcat/lol.rb
  def rainbow(freq, i) do
    r = :math.sin(freq*i + 0*:math.pi/ 3) * 127 + 128 |> trunc_to_ansi
    g = :math.sin(freq*i + 2*:math.pi/ 3) * 127 + 128 |> trunc_to_ansi
    b = :math.sin(freq*i + 4*:math.pi/ 3) * 127 + 128 |> trunc_to_ansi
    {r, g, b}
  end

  def trunc_to_ansi(v) do
    (6 * (v / 256)) |> Kernel.trunc
  end

  # def hex_to_rgb(string) do
  #   f = fn (s, r) -> s |> String.slice(r) |> String.to_integer(16) end
  #   {
  #     f.(string, 1..2),
  #     f.(string, 3..4),
  #     f.(string, 5..6)
  #   }
  # end
end
