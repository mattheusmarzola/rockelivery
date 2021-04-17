defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
      message: "User created!", 
      user: %Rockelivery.Users.User{
        address: "Rua logo ali", 
        age: 28, 
        cep: "12345678", 
        cpf: "12345678900", 
        email: "ameil@email.com", 
        id: "887c61be-7041-477c-8b5c-a6fc6988fef3", 
        inserted_at: nil, 
        name: "Nome", 
        password: "123123", 
        password_hash: nil, 
        updated_at: nil
      }
    } = response
  end
end
