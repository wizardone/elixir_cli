defmodule TravisCli do

  @api_client Application.get_env(:travis_cli, :api_client)

  def main([]) do
    IO.puts("Please provide arguments")
  end

  def main(args) when is_list(args) do
    { valid, _, _ } = OptionParser.parse(args, switches: switches())
    case valid do
      [build: build] -> get_build(build)
      [user: username] -> get_user(username)
      [active: username] -> get_active(username)
      [me: _] -> me()
      [help: _] -> print_help()
      _ -> IO.puts("Not a valid command, please use --help")
    end
  end

  defp print_help do
    IO.puts("Provide one of : --build, --active, --me to retrieve information from Travis")
  end

  defp me() do
    @api_client.me()
  end

  defp get_user(username) do
    @api_client.get_user(username)
  end

  defp get_active(username) do
    @api_client.get_active(username)
  end

  defp get_build(_build) do
  end

  defp switches do
    [
      build: :string,
      builds: :string,
      active: :string,
      user: :string,
      me: :boolean
    ]
  end
end
