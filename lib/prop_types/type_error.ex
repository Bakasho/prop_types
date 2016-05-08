defmodule PropTypes.TypeError do
	@moduledoc """
	Exception raised when a type does not match the excepted type
	"""

	defexception [:actual, :expected, :message]

	def exception(opts) do
		act = Keyword.fetch!(opts, :actual)
		exp = Keyword.fetch!(opts, :expected)
		
		%PropTypes.TypeError{
			message: "invalid type: expected `#{exp}` but got `#{act}`",
			actual: act,
			expected: exp
		}
	end

end