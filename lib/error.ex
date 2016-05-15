defmodule PropTypes.Error do

  defexception [:prop_name, :caller_name, :message]

  def exception(prop_name, caller_name, msg), do: %PropTypes.Error{
      prop_name: prop_name,
      caller_name: caller_name,
      message: msg
    }

end
