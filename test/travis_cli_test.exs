defmodule TravisCliTest do
  import ExUnit.CaptureIO
  import Mox

  use ExUnit.Case
  doctest TravisCli

  test "main no args" do
    assert capture_io(fn -> TravisCli.main([]) end) == "Please provide arguments\n"
  end

  test "main help" do
    assert capture_io(fn -> TravisCli.main(["--help"]) end) == "Provide one of : --build, --builds, --user to retrieve information from Travis\n"
  end

  test "main not a valid command" do
    assert capture_io(fn -> TravisCli.main(["--foobar"]) end) == "Not a valid command, please use --help\n"
  end

  test "--user option"do
    
  end
end
