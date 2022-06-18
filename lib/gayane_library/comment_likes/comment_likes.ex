defmodule GayaneLibrary.CommentLikes do
  @moduledoc """
  Describes the context of the book
  """

  alias GayaneLibrary.CommentLikes.Commands.{
    CreateCommentLike,
    DeleteCommentLike
  }

  alias GayaneLibrary.CommentLikes.Queries.{
    GetCommentLike,
    ListCommentLikes
  }

  # Commands
  defdelegate create_comment_like(attrs), to: CreateCommentLike, as: :process
  defdelegate delete_comment_like(comment_like), to: DeleteCommentLike, as: :process

  # Queries
  defdelegate get_comment_like(id), to: GetCommentLike, as: :process
  defdelegate list_comment_likes(comment, params \\ %{}), to: ListCommentLikes, as: :process
end
