defmodule EDI.Factory do
  use ExMachina.Ecto, repo: EDI.Repo

  alias EDI.{User}

  def user_factory do
    %User{
      name: Faker.Name.name,
      email: sequence(:email, &"email-#{&1}@example.com"),
      password_hash: Comeonin.Bcrypt.hashpwsalt("secret"),
    }
  end
end
