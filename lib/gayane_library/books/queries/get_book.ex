defmodule GayaneLibrary.Books.Queries.GetBook do
  @moduledoc """
  GetBook Query find book by id
  """

  alias GayaneLibrary.Books.Entities.Book
  alias GayaneLibrary.Repo

  def process(id) do
    Repo.find(Book, id)
  end
end
