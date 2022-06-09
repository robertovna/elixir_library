defmodule GayaneLibrary.Books.Commands.DeleteBook do
  @moduledoc """
  Defines delete book command
  """

  alias GayaneLibrary.Books.Entities.Book
  alias GayaneLibrary.Repo

  def process(%Book{} = book) do
    Repo.delete(book)
  end
end
