defmodule ElixirApplicationSampleTest do
  use ExUnit.Case
  doctest ElixirApplicationSample

  test "greets the world" do
    assert ElixirApplicationSample.hello() == :world
  end
end
