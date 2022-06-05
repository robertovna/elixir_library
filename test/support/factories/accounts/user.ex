defmodule GayaneLibrary.Factories.Accounts.UserFactory do
  @moduledoc """
  Determines UserFactory for ExMachina
  """
  defmacro __using__(_opts) do
    quote do
      alias Faker.{Internet, Lorem}
      alias GayaneLibrary.Accounts.Entities.User

      def user_factory(attrs) do
        password =
          Map.get(attrs, :password, Lorem.characters(8..16))
          |> to_string()

        password_hash = Argon2.add_hash(password).password_hash
        email = Map.get(attrs, :email, Internet.email())

        %User{
          password: password,
          password_hash: password_hash,
          email: sequence(:email, &"#{&1}_#{email}")
        }
      end
    end
  end
end
