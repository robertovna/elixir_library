defmodule GayaneLibrary.CommentLikes.Queries.GetCommentLike do
  @moduledoc """
  GetCommentLike Query find comment_like by id
  """

  alias GayaneLibrary.Repo
  alias GayaneLibrary.CommentLikes.Entities.CommentLike

  def process(id) do
    Repo.find(CommentLike, id)
  end
end
