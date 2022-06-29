defmodule ElastackTest do
  use ExUnit.Case
  doctest Elastack

  test "greets the world" do
    assert Elastack.hello() == :world
  end
end
