defmodule TravisCli.TravisApi do
  @callback me :: any
  @callback get_user(any) :: any
  @callback get_active(any) :: any
end

defmodule TravisCli.RealTravisApi do
  @behaviour TravisCli.TravisApi
  @travis_api "https://api.travis-ci.org"
  @headers ["Authorization": "token #{Application.get_env(:travis_cli, :travis_token)}", "Travis-API-Version": "3"]

  def me do
    case HTTPoison.get(@travis_api <> "/user", @headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts(body)
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts(reason)
    end
  end

  def get_user(username) do
    case HTTPoison.get(@travis_api <> "/user/#{username}", @headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts(body)
      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        IO.puts(body)
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts(reason)
    end
  end

  def get_active(login) do
    case HTTPoison.get(@travis_api <> "/owner/#{login}/active", @headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts(body)
      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        IO.puts(body)
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts(reason)
    end
  end
end
