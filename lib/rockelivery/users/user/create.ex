defmodule Rockelivery.Users.User.Create do
  alias Rockelivery.Error
  alias Rockelivery.Repo
  alias Rockelivery.Users.User

  def call(params) do
    params
    |> User.changeset_create()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
