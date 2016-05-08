defmodule PropTypes.RequiredKeyError do
	@moduledoc """
	Exception raised when a type does not match the excepted type
	"""

	defexception [:key, :message]

	def exception(opts) do
		k = Keyword.fetch!(opts, :key)
		
		%PropTypes.RequiredKeyError{
			message: "key error: required key `#{k}` not in map",
			key: k
		}
	end

end