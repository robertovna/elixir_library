defmodule GayaneLibrary.Books.Commands.UpdateBook do
  @moduledoc """
  Defines update book command
  """

  alias GayaneLibrary.Books.Entities.Book
  alias GayaneLibrary.Repo

  def process(%Book{} = book, attrs) do
    book
    |> Book.update_changeset(attrs)
    |> Repo.update()
  end
end
