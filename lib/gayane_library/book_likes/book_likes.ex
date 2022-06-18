defmodule GayaneLibrary.BookLikes do
  @moduledoc """
  Describes the context of the book
  """

  alias GayaneLibrary.BookLikes.Commands.{
    CreateBookLike,
    DeleteBookLike
  }

  alias GayaneLibrary.BookLikes.Queries.{
    GetBookLike,
    ListBookLikes
  }

  # Commands
  defdelegate create_book_like(attrs), to: CreateBookLike, as: :process
  defdelegate delete_book_like(book_like), to: DeleteBookLike, as: :process

  # Queries
  defdelegate get_book_like(id), to: GetBookLike, as: :process
  defdelegate list_book_likes(book, params \\ %{}), to: ListBookLikes, as: :process
end
