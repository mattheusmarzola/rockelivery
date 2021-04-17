defmodule Rockelivery.Items do
  alias Rockelivery.Items.Item

  defdelegate create_item(params), to: Item.Create, as: :call
#  defdelegate get_item_by_id(id), to: Item.Get, as: :by_id
#  defdelegate delete_item_by_id(id), to: Item.Delete, as: :by_id
#  defdelegate update_item(params), to: Item.Update, as: :call
  
end
