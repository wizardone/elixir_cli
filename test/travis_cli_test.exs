defmodule TravisCliTest do
  use ExUnit.Case
  doctest TravisCli

  test "greets the world" do
    assert TravisCli.hello() == :world
  end
end
