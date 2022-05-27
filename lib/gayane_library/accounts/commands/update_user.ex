defmodule GayaneLibrary.Accounts.Commands.UpdateUser do
  @moduledoc """
  Defines update user command
  """

  alias GayaneLibrary.Accounts.Entitites.User
  alias GayaneLibrary.Repo

  def process(%User{} = user, attrs) do
    user
    |> User.update_changeset(attrs)
    |> Repo.update()
  end
end
