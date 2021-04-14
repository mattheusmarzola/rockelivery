defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller
  
  alias Rockelivery.Users
  alias Rockelivery.Users.User

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create_user(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", user: user)
    end
  end
end
