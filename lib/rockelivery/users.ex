defmodule Rockelivery.Users do
  alias Rockelivery.Users.User

  defdelegate create_user(params), to: User.Create, as: :call
  
end
