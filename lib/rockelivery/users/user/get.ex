defmodule Rockelivery.Users.User.Get do

  alias Ecto.UUID
  alias Rockelivery.Error
  alias Rockelivery.Repo
  alias Rockelivery.Users.User
  

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_user_id_format_error()}
      {:ok, uuid} -> get_by_id(uuid)
    end
  end

  defp get_by_id(id) do
    case  Repo.get(User, id) do
      nil ->  {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
