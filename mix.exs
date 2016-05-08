defmodule PropTypes.Mixfile do
  use Mix.Project

  def project do
    [app: :prop_types,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:tipo]]
  end

  defp deps do
    [{:tipo, "~> 0.0.3"}]
  end
end
