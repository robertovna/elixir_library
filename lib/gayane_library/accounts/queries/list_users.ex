defmodule GayaneLibrary.Accounts.Queries.ListUsers do
  @moduledoc """
  ListUser Query return all users
  """

  alias GayaneLibrary.Repo
  alias GayaneLibrary.Accounts.Entities.User

  def process() do
    Repo.all(User)
  end
end
