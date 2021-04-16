defmodule Rockelivery.Users.User.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.Error
  alias Rockelivery.Users.User
  alias Rockelivery.Users.User.Create

  describe "call/1" do
    
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      result = Create.call(params)

      assert {:ok, 
        %User{
          id: _id, 
          address: "Rua logo ali",
          age: 28,
          cep: "12345678",
          cpf: "12345678900",
          email: "ameil@email.com",
          name: "Nome",
          password: "123123"
        }
      }  = result
    end
    
    test "when there are valid params, returns an error" do
      params = build(:user_params, %{password: "123", age: 15})

      response = Create.call(params)

      expected_result = %{
        age: ["must be greater than or equal to 18"], 
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_result
    end
  end
end
