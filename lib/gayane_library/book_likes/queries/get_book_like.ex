defmodule GayaneLibrary.BookLikes.Queries.GetBookLike do
  @moduledoc """
  GetBookLike Query find book_like by id
  """

  alias GayaneLibrary.BookLikes.Entities.BookLike
  alias GayaneLibrary.Repo

  def process(id) do
    Repo.find(BookLike, id)
  end
end
