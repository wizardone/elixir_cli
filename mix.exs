defmodule TravisCli.MixProject do
  use Mix.Project

  def project do
    [
      app: :travis_cli,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env),
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib", "test/support"]
  defp escript, do: [main_module: TravisCli]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:mox, "~> 0.3", only: :test},
      {:poison, "~> 3.1"}
    ]
  end
end
