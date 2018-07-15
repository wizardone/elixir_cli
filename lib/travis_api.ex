defmodule TravisCli.TravisApi do
  @callback me :: String.t
  @callback get_user(String.t) :: String.t
  @callback get_active(String.t) :: String.t
end

defmodule TravisCli.RealTravisApi do
  @behaviour TravisCli.TravisApi
  @travis_api "https://api.travis-ci.org"
  @headers ["Authorization": "token #{Application.get_env(:travis_cli, :travis_token)}", "Travis-API-Version": "3"]

  def me do
    perform_call(@travis_api <> "/user")
  end

  def get_user(username) do
    perform_call(@travis_api <> "/user/#{username}")
  end

  def get_active(login) do
    perform_call(@travis_api <> "/owner/#{login}/active")
  end

  defp perform_call(url) do
    case HTTPoison.get(url, @headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode!()
        |> parse_body()
      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        body
        |> parse_body
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts(reason)
    end
  end


  defp parse_body(body) when is_map(body) do
    body
    |> Enum.each(fn {key, value} ->
      case value do
        %{} ->
          parse_body(%{})
        _ ->
        IO.puts("#{key} -> #{value}")
      end
    end)
  end
end
