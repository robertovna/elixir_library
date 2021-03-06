defmodule GayaneLibrary.Factories do
  @moduledoc """
  Defines the factories for ExMachina
  """
  use ExMachina.Ecto, repo: GayaneLibrary.Repo

  use GayaneLibrary.Factories.{
    Accounts.UserFactory,
    Books.BookFactory,
    Tags.TagFactory,
    Comments.CommentFactory,
    CommentLikes.CommentLikeFactory,
    BookLikes.BookLikeFactory
  }
end
