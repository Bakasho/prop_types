defmodule PropTypes.Mixfile do
  use Mix.Project

  def project do
    [app: :prop_types,
     version: "0.0.1",
     elixir: "~> 1.2",
     description: description,
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:tipo]]
  end

  def description do
    """
    Property Type validations and checkers for elixir apps
    """
  end

  def package do
    [
      name: :tipo,
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      licenses: ["MIT"],
      maintainers: ["John Faucett", "Nathan Faucett"],
      links: %{"GitHub" => "https://github.com/bakasho/prop_types"}
    ]
  end

  defp deps do
    [{:tipo, "~> 0.0.3"}]
  end
end
