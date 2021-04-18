defmodule Rockelivery.Orders do
  alias Rockelivery.Orders.{Item, Order}

  defdelegate create_item(params), to: Item.Create, as: :call

  defdelegate create_order(params), to: Order.Create, as: :call
  
end
