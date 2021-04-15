defmodule Rockelivery.Users.User.Delete do

  alias Ecto.UUID
  alias Rockelivery.Repo
  alias Rockelivery.Users.User
  

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_request, result: "Invalid id format!"}}
      {:ok, uuid} -> delete_by_id(uuid)
    end
  end

  defp delete_by_id(id) do
    case  Repo.get(User, id) do
      nil ->  {:error, %{status: :not_found, result: "User not found!"}}
      user -> Repo.delete(user)
    end
  end
end
