defmodule GayaneLibrary.CommentLikes.Commands.DeleteCommentLike do
  @moduledoc """
  Defines delete comment_like command
  """

  alias GayaneLibrary.CommentLikes.Entities.CommentLike
  alias GayaneLibrary.Repo

  def process(%CommentLike{} = comment_like) do
    Repo.delete(comment_like)
  end
end
