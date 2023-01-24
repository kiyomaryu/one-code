defmodule ElixirTaskSampleTest do
  use ExUnit.Case
  doctest ElixirTaskSample

  test "greets the world" do
    assert ElixirTaskSample.hello() == :world
  end
end
