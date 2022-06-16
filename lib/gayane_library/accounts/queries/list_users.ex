defmodule GayaneLibrary.Accounts.Queries.ListUsers do
  @moduledoc """
  ListUser Query return all users
  """

  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Repo

  def process do
    Repo.all(User)
  end
end
