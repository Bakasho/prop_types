# PropTypes

Property Type validations and checkers for elixir apps

## Usage

```elixir

checker = PropTypes.create_checker(%{
  # %{ :validations => [PropTypes.string] :required => false }
	"username" => PropTypes.optional(PropTypes.string),
  # %{ :validations => [PropTypes.string] :required => true }
	"password" => PropTypes.required(PropTypes.string)
})

checker.(%{"username"})

```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add prop_types to your list of dependencies in `mix.exs`:

        def deps do
          [{:prop_types, "~> 0.0.2"}]
        end

  2. Ensure prop_types is started before your application:

        def application do
          [applications: [:prop_types]]
        end
