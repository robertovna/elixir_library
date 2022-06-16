defmodule GayaneLibrary.CommentLikes.Queries.ListCommentLikes do
  @moduledoc """
  ListCommentLikes Query return all comment likes
  """
  import Ecto.Query, only: [from: 2]

  alias GayaneLibrary.CommentLikes.Entities.CommentLike
  alias GayaneLibrary.Repo

  def process(comment) do
    CommentLike
    |> by_comment(comment.id)
    |> Repo.all()
  end

  defp by_comment(query, comment_id) do
    from comment_like in query,
      where: comment_like.comment_id == ^comment_id
  end
end
