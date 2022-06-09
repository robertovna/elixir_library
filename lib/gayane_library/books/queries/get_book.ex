defmodule GayaneLibrary.Books.Queries.GetBook do
  @moduledoc """
  GetBook Query find book by id
  """

  alias GayaneLibrary.Repo
  alias GayaneLibrary.Books.Entities.Book

  def process(id) do
    Repo.find(Book, id)
  end
end
