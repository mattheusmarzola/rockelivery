defmodule Rockelivery.Users do
  alias Rockelivery.Users.User

  defdelegate create(params), to: User.Create, as: :call
  defdelegate get_by_id(id), to: User.Get, as: :by_id
  defdelegate delete_by_id(id), to: User.Delete, as: :by_id
  defdelegate update(id), to: User.Update, as: :call
  
end
