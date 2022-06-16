defmodule GayaneLibrary.CommentLikes.Queries.GetCommentLike do
  @moduledoc """
  GetCommentLike Query find comment_like by id
  """

  alias GayaneLibrary.CommentLikes.Entities.CommentLike
  alias GayaneLibrary.Repo

  def process(id) do
    Repo.find(CommentLike, id)
  end
end
