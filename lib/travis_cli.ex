defmodule TravisCli do

  @api_client Application.get_env(:travis_cli, :api_client)

  def main([]) do
    IO.puts("Please provide arguments")
  end

  def main(args) when is_list(args) do
    { valid, _, _ } = OptionParser.parse(args, switches: switches())
    case valid do
      [build: build] -> get_build(build)
      [me: me] -> me()
      [help: _] -> print_help()
      _ -> IO.puts("Not a valid command, please use --help")
    end
  end

  defp print_help do
    IO.puts("Provide one of : --build, --builds, --me to retrieve information from Travis")
  end

  defp get_build(_build) do
  end

  defp me() do
    @api_client.me()
  end

  defp switches do
    [
      build: :string,
      builds: :string,
      me: :boolean
    ]
  end
end
