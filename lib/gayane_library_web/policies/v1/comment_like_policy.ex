defmodule GayaneLibraryWeb.V1.CommentLikePolicy do
  @moduledoc """
  Describes CommentLike policy for user actrions
  """
  @behaviour Bodyguard.Policy

  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.CommentLikes.Entities.CommentLike

  def authorize(action, %User{id: id}, %CommentLike{user_id: id})
      when action in [:delete],
      do: :ok

  def authorize(action, %User{id: _id}, %CommentLike{user_id: _other_id})
      when action in [:show, :index, :create],
      do: :ok

  def authorize(_action, _user, _params), do: false
end
