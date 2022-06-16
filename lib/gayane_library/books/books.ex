defmodule GayaneLibrary.Books do
  @moduledoc """
  Describes the context of the book
  """

  alias GayaneLibrary.Books.Commands.{
    CreateBook,
    DeleteBook,
    UpdateBook
  }

  alias GayaneLibrary.Books.Queries.{
    GetBook,
    ListBooks
  }

  # Commands
  defdelegate create_book(attrs), to: CreateBook, as: :process
  defdelegate delete_book(book), to: DeleteBook, as: :process
  defdelegate update_book(book, attrs), to: UpdateBook, as: :process

  # Queries
  defdelegate get_book(id), to: GetBook, as: :process
  defdelegate list_books(params \\ %{}), to: ListBooks, as: :process
end
