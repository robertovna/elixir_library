defmodule GayaneLibrary.Accounts.Queries.GetUser do
  @moduledoc """
  GetUser Query find user by id
  """

  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Repo

  def process(id) do
    Repo.find(User, id)
  end
end
