defmodule TravisCli.TravisApi do
  @behaviour TravisCli.TravisApiBehaviour
  @travis_api "https://api.travis-ci.org"
  @headers ["Authorization": "token #{Application.get_env(:elixir_cli, :travis_token)}", "Travis-API-Version": "3"]

  def get_user(_user) do
    case HTTPoison.get(@travis_api <> "/user", @headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts(body)
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts(reason)
    end
  end

  def get_build(_build) do
  end
end
