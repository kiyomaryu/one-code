defmodule ElixirSchoolTest do
  use ExUnit.Case
  doctest ElixirSchool

  test "greets the world" do
    assert ElixirSchool.hello() == :world
  end
end
