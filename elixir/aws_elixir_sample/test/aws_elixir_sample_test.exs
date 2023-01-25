defmodule AwsElixirSampleTest do
  use ExUnit.Case
  doctest AwsElixirSample

  test "greets the world" do
    assert AwsElixirSample.hello() == :world
  end
end
