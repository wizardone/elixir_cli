defmodule TravisCli.FakeTravisApi do
  @behaviour TravisCli.TravisApi

  def me do
    IO.puts("Some user information")
  end
end
