defmodule ElixirCli do
  def main([]) do
    IO.puts("No args provided")
  end

  def main(args) when is_list(args) do
    IO.puts(OptionParser.parse(args, switches: [key: :string]))
  end
end
