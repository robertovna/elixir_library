defmodule GayaneLibrary.Accounts.Commands.CreateUser do
  @moduledoc """
  Defines create user command
  """

  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Repo

  def process(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end
end
