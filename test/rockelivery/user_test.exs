defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.Users.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)      

      result = User.changeset_create(params)

      assert %Changeset{changes: %{name: "Nome"}, valid?: true} = result
    end    

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:user_params)      
      update_params = %{name: "Joaquim"}

      changeset = User.changeset_create(params)
      result = User.changeset_create(changeset, update_params)

      assert %Changeset{changes: %{name: "Joaquim"}, valid?: true} = result
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params, %{age: 10, cpf: ""})      
      result = User.changeset_create(params)
      expected_result = %{age: ["must be greater than or equal to 18"], cpf: ["can't be blank"]}

      assert  errors_on(result) == expected_result
    end
  end

end
