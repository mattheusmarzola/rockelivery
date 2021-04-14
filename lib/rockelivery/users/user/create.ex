defmodule Rockelivery.Users.User.Create do
  
  alias Rockelivery.Repo
  alias Rockelivery.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end

end
