defmodule GayaneLibraryWeb.V1.BookPolicy do
  @moduledoc """
  Describes book policy for user actrions
  """
  @behaviour Bodyguard.Policy

  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Books.Entities.Book

  def authorize(action, %User{id: id}, %Book{user_id: id})
      when action in [:show],
      do: :ok

  def authorize(_action, _user, _params), do: false
end
