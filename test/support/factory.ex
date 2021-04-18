defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.Users.User

  def user_params_factory do
    %{
      address: "Rua logo ali",
      age: 28,
      cep: "12345678",
      cpf: "12345678900",
      email: "ameil@email.com",
      name: "Nome",
      password: "123123"
    }
  end

  def user_factory do
    %User{
      address: "Rua logo ali",
      age: 28,
      cep: "12345678",
      cpf: "12345678900",
      email: "ameil@email.com",
      name: "Nome",
      password: "123123",
      id: "887c61be-7041-477c-8b5c-a6fc6988fef3"
    }
  end
end
