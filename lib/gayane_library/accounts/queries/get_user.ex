defmodule GayaneLibrary.Accounts.Queries.GetUser do
  @moduledoc """
  GetUser Query find user by id
  """

  alias GayaneLibrary.Repo
  alias GayaneLibrary.Accounts.Entities.User

  def process(id) do
    Repo.find(User, id)
  end
end
