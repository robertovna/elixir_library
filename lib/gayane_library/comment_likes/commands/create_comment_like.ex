defmodule GayaneLibrary.CommentLikes.Commands.CreateCommentLike do
  @moduledoc """
  Defines create comment like command
  """

  alias GayaneLibrary.CommentLikes.Entities.CommentLike
  alias GayaneLibrary.Repo

  def process(attrs) do
    %CommentLike{}
    |> CommentLike.create_changeset(attrs)
    |> Repo.insert()
  end
end
