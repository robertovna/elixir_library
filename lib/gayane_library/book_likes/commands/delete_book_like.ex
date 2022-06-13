defmodule GayaneLibrary.BookLikes.Commands.DeleteBookLike do
  @moduledoc """
  Defines delete book_like command
  """

  alias GayaneLibrary.BookLikes.Entities.BookLike
  alias GayaneLibrary.Repo

  def process(%BookLike{} = book_like) do
    Repo.delete(book_like)
  end
end
