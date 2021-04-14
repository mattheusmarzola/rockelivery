defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller
  
  alias Rockelivery.Users
  alias Rockelivery.Users.User
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:ok)
      |> render("create.json", user: user)
    end
  end
end
