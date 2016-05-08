defmodule PropTypesTest do
  	use ExUnit.Case
  	doctest PropTypes

  	test "atom" do
    	assert PropTypes.atom(%{"a" => :a}, "a") == nil
    	
    	assert_raise PropTypes.TypeError, ~r/expected `atom` but got `number`/, fn ->
    		PropTypes.atom(%{"a" => 45}, "a")
    	end
  	end

  	test "boolean" do
  		assert PropTypes.boolean(%{"a" => true}, "a") == nil

  		assert_raise PropTypes.TypeError, ~r/expected `boolean` but got `atom`/, fn ->
    		PropTypes.boolean(%{"a" => :atom}, "a")
    	end
  	end
  	
end
