defmodule GayaneLibrary.Accounts.Commands.DeleteUser do
  @moduledoc """
  Defines delete user command
  """
  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Repo

  def process(%User{} = user) do
    Repo.delete(user)
  end
end
