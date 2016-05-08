defmodule PropTypes.Funcs do
	
	def create_type_checker(validator_fn, opts) do

		fn (props, key) ->

			kexist = Map.has_key?(props, key)

			cond do
				opts == :required and !kexist -> raise PropTypes.RequiredKeyError, key: key
				kexist -> validator_fn.(props, key)
				true -> nil
			end
		end

	end

	def create_primitive_type_checker(expected_type, options) do

		create_type_checker(fn (props, prop_name) ->

			value = Map.get(props, prop_name)
			type = Tipo.typeof(value)

			if type != expected_type do
				raise PropTypes.TypeError, actual: type, expected: expected_type
			else
				nil
			end

		end, options)
	end

end