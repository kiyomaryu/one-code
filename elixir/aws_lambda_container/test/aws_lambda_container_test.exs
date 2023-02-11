defmodule AwsLambdaContainerTest do
  use ExUnit.Case
  doctest AwsLambdaContainer

  test "greets the world" do
    assert AwsLambdaContainer.hello() == :world
  end
end
