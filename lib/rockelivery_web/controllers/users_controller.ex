defmodule RockeliveryWeb.UsersController do
  use RockeliveryWeb, :controller
  
  alias Rockelivery.Users
  alias Rockelivery.Users.User
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Users.delete_by_id(id) do
      conn
      |> put_status(:no_content)
      |> text("") 
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user) 
    end
  end
end
