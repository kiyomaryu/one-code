defmodule ElixirSchoolMixTest do
  use ExUnit.Case
  doctest ElixirSchoolMix

  test "greets the world" do
    assert ElixirSchoolMix.hello() == :world
  end
end
