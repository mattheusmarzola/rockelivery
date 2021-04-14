defmodule Rockelivery.Users do
  alias Rockelivery.Users.User

  defdelegate create(params), to: User.Create, as: :call
  defdelegate get_by_id(id), to: User.Get, as: :by_id
  
end
