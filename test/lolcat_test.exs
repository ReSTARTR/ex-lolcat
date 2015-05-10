defmodule LolcatTest do
  use ExUnit.Case

  import Lolcat

  test :trunc_to_ansi do
    assert trunc_to_ansi(10) == 0
    assert trunc_to_ansi(38) == 0
    assert trunc_to_ansi(128) == 3
    assert trunc_to_ansi(255) == 5
    assert trunc_to_ansi(255.0) == 5
  end

  test :rainbow do
    assert rainbow(1, 1) == {5, 3, 0}
    assert rainbow(3, 1) == {3, 0, 5}
    assert rainbow(100, 1) == {1, 5, 1}
  end
end
