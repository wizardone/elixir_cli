defmodule TravisCli.FakeTravisApi do
  @behaviour TravisCli.TravisApi
  # TODO: user proper HTTPoison.Response bodies
  def me do
    IO.puts("My information")
  end

  def get_user(username) do
    IO.puts("Some user information about #{username}")
  end
end
