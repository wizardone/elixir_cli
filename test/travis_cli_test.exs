defmodule TravisCliTest do
  import ExUnit.CaptureIO
  import Mox

  use ExUnit.Case
  doctest TravisCli

  setup :verify_on_exit!

  test "main no args" do
    assert capture_io(fn -> TravisCli.main([]) end) == "Please provide arguments\n"
  end

  test "main help" do
    assert capture_io(fn -> TravisCli.main(["--help"]) end) == "Provide one of : --build, --builds, --me to retrieve information from Travis\n"
  end

  test "main not a valid command" do
    assert capture_io(fn -> TravisCli.main(["--foobar"]) end) == "Not a valid command, please use --help\n"
  end

  test "--me option" do
    TravisCli.FakeTravisApi
      |> expect(:me, fn() -> IO.puts("My information") end)

    assert capture_io(fn -> TravisCli.main(["--me"]) end) == "My information\n"
  end

  test "--user option" do
    username = "12323"
    TravisCli.FakeTravisApi
      |> expect(:get_user, fn(_) -> IO.puts("Some user information about #{username}") end)

    assert capture_io(fn -> TravisCli.main(["--user", username]) end) == "Some user information about #{username}\n"
  end
end
