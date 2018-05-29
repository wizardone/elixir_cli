defmodule TravisApi do

  @travis_api "https://api.travis-ci.org"
  @headers ["Authorization": "token #{Application.get_env(:elixir_cli, :travis_token)}", "Travis-API-Version": "3"]
  @http_client HTTPoison

  def get_user(user) do
    case @http_client.get(@travis_api <> "/user", @headers) do
      {:ok, %@http_client.Response{status_code: 200, body: body}} ->
        IO.puts(body)
      {:error, %@http_client.Error{reason: reason}} ->
        IO.puts(reason)
    end
  end

  def get_build(build) do
  end
end
