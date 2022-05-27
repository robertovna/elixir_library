defmodule GayaneLibrary.Accounts.Commands.DeleteUser do
  @moduledoc """
  Defines delete user command
  """
  alias GayaneLibrary.Accounts.Entitites.User
  alias GayaneLibrary.Repo

  def process(%User{} = user) do
    Repo.delete(user)
  end
end
