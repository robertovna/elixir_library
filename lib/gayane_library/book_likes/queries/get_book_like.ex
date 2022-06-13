defmodule GayaneLibrary.BookLikes.Queries.GetBookLike do
  @moduledoc """
  GetBookLike Query find book_like by id
  """

  alias GayaneLibrary.Repo
  alias GayaneLibrary.BookLikes.Entities.BookLike

  def process(id) do
    Repo.find(BookLike, id)
  end
end
