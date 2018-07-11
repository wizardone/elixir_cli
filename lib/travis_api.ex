defmodule TravisCli.TravisApi do
  @behaviour TravisCli.TravisApiBehaviour
  @travis_api "https://api.travis-ci.org"
  @headers ["Authorization": "token #{Application.get_env(:elixir_cli, :travis_token)}", "Travis-API-Version": "3"]

  def get_user(user_id) do
    perform_call()
  end

  def get_me() do
    perform_call()
  end

  defp perform_call(url) do
    case HTTPoison.get(url, @headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode!()
        |> pretty_print()
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Can't find user #{user_id}")
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts(reason)
    end
  end

  defp pretty_print(value, level \\ 0)

  defp pretty_print({key, value}, level) when is_map(value) do
    # IO.puts("#{String.duplicate(" ", level)}#{key}")
    IO.puts(key)
    pretty_print(value, level + String.length(key))
  end

  defp pretty_print({key, value}, level) do
    IO.puts("#{String.duplicate(" ", level)}#{key}: #{inspect value}")
  end

  defp pretty_print(map, level) when is_map(map) do
    Enum.each(map, fn pair -> pretty_print(pair, level) end)
  end
end
