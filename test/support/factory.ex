defmodule Rockelivery.Factory do
  use ExMachina

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
  
end
