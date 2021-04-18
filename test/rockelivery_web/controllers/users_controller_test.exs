defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, create the user", %{conn: conn} do
      params = %{
        "address" => "Rua logo ali",
        "age" => 28,
        "cep" => "12345678",
        "cpf" => "12345678900",
        "email" => "ameil@email.com",
        "name" => "Nome",
        "password" => "123123"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua logo ali",
                 "age" => 28,
                 "cpf" => "12345678900",
                 "email" => "ameil@email.com",
                 "id" => _id,
                 "name" => "Nome"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "cep" => "12345678",
        "cpf" => "12345678900",
        "email" => "ameil@email.com",
        "name" => "Nome"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "address" => ["can't be blank"],
                 "age" => ["can't be blank"],
                 "password" => ["can't be blank"]
               }
             } = response
    end
  end

  describe "delete/2" do
    test "when there is a user with given id, deletes the user", %{conn: conn} do
      id = "887c61be-7041-477c-8b5c-a6fc6988fef3"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
