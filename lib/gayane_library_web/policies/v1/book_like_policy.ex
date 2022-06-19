defmodule GayaneLibraryWeb.V1.BookLikePolicy do
  @moduledoc """
  Describes BookLike policy for user actrions
  """
  @behaviour Bodyguard.Policy

  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.BookLikes.Entities.BookLike

  def authorize(action, %User{id: id}, %BookLike{user_id: id})
      when action in [:delete],
      do: :ok

  def authorize(action, %User{id: _id}, %BookLike{user_id: _other_id})
      when action in [:show, :index, :create],
      do: :ok

  def authorize(_action, _user, _params), do: false
end
