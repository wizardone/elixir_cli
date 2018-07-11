defmodule TravisCli do

  def main([]) do
    IO.puts("Please provide arguments")
  end

  def main(args) when is_list(args) do
    { valid, _, _ } = OptionParser.parse(args, switches: switches())
    case valid do
      [build: build] -> get_build(build)
      [user: user] -> get_user(user)
      [help: _] -> print_help()
      [me: _] -> get_me()
      _ -> IO.puts("Not a valid command, please use --help")
    end
  end

  defp print_help do
    IO.puts("Provide one of : --build, --builds, --user to retrieve information from Travis")
  end

  defp get_build(build) do
  end

  defp get_user(user) do
    TravisCli.TravisApi.get_user(user)
  end

  defp get_me do
    TravisCli.TravisApi.get_me()
  end

  defp switches do
    [
      build: :string,
      builds: :string,
      user: :integer,
      me: :boolean
    ]
  end
end
