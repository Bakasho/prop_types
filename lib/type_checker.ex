defmodule PropTypes.TypeChecker do

  def create(validate) do
    fn (props, prop_name, caller_name, prop_options) ->
      if Map.has_key?(props, prop_name) == true do
        validate.(props, prop_name, caller_name, prop_options)
      else
        if Map.get(prop_options, :required) == true do
          PropTypes.Error.exception(prop_name, caller_name, "prop_types.required")
        else
          nil
        end
      end
    end
  end

  def create_primitive(expected_type) do
    create(fn (props, prop_name, caller_name, _) ->
      value = Map.get(props, prop_name)
      type = Tipo.typeof(value)

      if type != expected_type do
        PropTypes.Error.exception(prop_name, caller_name, "prop_types.invalid_type")
      else
        nil
      end
    end)
  end

  def check(props, prop_types, caller_name) do
    results = Enum.filter(
      Enum.map(Map.keys(prop_types), fn (prop_name) ->
        prop_options = Map.get(prop_types, prop_name)
        errors = get_prop_errors(props, prop_name, caller_name, prop_options)

        if errors != [] do
          %{prop_name => errors}
        else
          nil
        end
      end),
      &not_nil/1
    )

    if results != [] do
      Enum.reduce(results, %{}, fn (value, errors) ->
        Map.merge(errors, value)
      end)
    else
      nil
    end
  end
  def check(props, prop_types), do: check(props, prop_types, "<<anonymous>>")

  def create_checker(prop_types, caller_name) do
    fn (props) ->
      check(props, prop_types, caller_name)
    end
  end
  def create_checker(prop_types), do: check(prop_types, "<<anonymous>>")

  def get_prop_errors(props, prop_name, caller_name, prop_options) do
    funcs = Map.get(prop_options, :validations)
    funcs = if Tipo.list?(funcs), do: funcs, else: [funcs]

    List.flatten(Enum.filter(
      Enum.map(funcs, fn (func) ->
        result = func.(props, prop_name, caller_name, prop_options)

        if result != nil do
          if Tipo.list?(result), do: result, else: [result]
        else
          nil
        end
      end),
      &not_nil/1
    ))
  end

  def not_nil(value), do: Tipo.nil?(value) == false
end
