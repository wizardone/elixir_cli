defmodule TravisCli do

  def main([]) do
    IO.puts("No args provided. You must supply one of: --build, --builds, --user")
  end

  def main(args) when is_list(args) do
    { valid, _, _ } = OptionParser.parse(args, switches: switches())
    case valid do
      [build: build] -> get_build(build)
      [user: user] -> get_user(user)
    end
  end

  defp get_build(build) do
    IO.puts("Getting build")
  end

  defp get_user(user) do
    IO.puts("Getting user")
  end

  defp switches do
    [
      build: :string,
      builds: :string,
      user: :string
    ]
  end
end
