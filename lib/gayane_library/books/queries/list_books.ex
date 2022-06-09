defmodule GayaneLibrary.Books.Queries.ListBooks do
  @moduledoc """
  ListBooks Query return all book
  """

  alias GayaneLibrary.Repo
  alias GayaneLibrary.Books.Entities.Book

  def process() do
    Repo.all(Book)
  end
end
