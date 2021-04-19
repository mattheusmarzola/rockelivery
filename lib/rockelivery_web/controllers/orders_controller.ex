defmodule RockeliveryWeb.OrderController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Orders
  alias Rockelivery.Orders.Order
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- Orders.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end
end
