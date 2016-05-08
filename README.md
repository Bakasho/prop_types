# PropTypes

Property Type validations and checkers for elixir apps

## Usage

```elixir

checker_fn = PropTypes.define_prop_checker(%{
	"username" => %{ :validators => [&PropTypes.string/3], :required => true},
	"password" => %{ :validators => [&PropTypes.string/3], :required => true}
})

checker_fn.(%{"username"})

```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add prop_types to your list of dependencies in `mix.exs`:

        def deps do
          [{:prop_types, "~> 0.0.1"}]
        end

  2. Ensure prop_types is started before your application:

        def application do
          [applications: [:prop_types]]
        end


