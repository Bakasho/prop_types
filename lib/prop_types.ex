defmodule PropTypes do

	import PropTypes.Funcs, only: [
		create_primitive_type_checker: 2
	]

	def atom(props, key, opts \\ :optional) do
		create_primitive_type_checker(:atom, opts).(props, key)
	end

	def boolean(props, key, opts \\ :optional) do
		create_primitive_type_checker(:boolean, opts).(props, key)
	end

	def number(props, key, opts \\ :optional) do
		create_primitive_type_checker(:number, opts).(props, key)
	end

	def integer(props, key, opts \\ :optional) do
		create_primitive_type_checker(:integer, opts).(props, key)
	end

	def float(props, key, opts \\ :optional) do
		create_primitive_type_checker(:float, opts).(props, key)
	end

	def string(props, key, opts \\ :optional) do
		create_primitive_type_checker(:string, opts).(props, key)
	end

	def bitstring(props, key, opts \\ :optional) do
		create_primitive_type_checker(:bitstring, opts).(props, key)
	end

	def binary(props, key, opts \\ :optional) do
		create_primitive_type_checker(:binary, opts).(props, key)
	end

	def function(props, key, opts \\ :optional) do
		create_primitive_type_checker(:function, opts).(props, key)
	end

	def list(props, key, opts \\ :optional) do
		create_primitive_type_checker(:list, opts).(props, key)
	end

	def map(props, key, opts \\ :optional) do
		create_primitive_type_checker(:map, opts).(props, key)
	end

	def tuple(props, key, opts \\ :optional) do
		create_primitive_type_checker(:tuple, opts).(props, key)
	end
	

	defp check_props(definition, input) do
		Enum.each(Map.keys(definition), fn(k) -> 
			
			cfg_m = Map.get(definition, k)
			req = if cfg_m[:required], do: :required, else: :optional

			Enum.each(cfg_m[:validators], fn(validator) -> 
				validator.(input, k, req)
			end)

		end)
	end

	def define_prop_checker(definition) do
		fn (input_params) -> check_props(definition, input_params) end
	end

end
