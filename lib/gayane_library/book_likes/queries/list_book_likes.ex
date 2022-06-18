defmodule GayaneLibrary.BookLikes.Queries.ListBookLikes do
  @moduledoc """
  ListBookLikes Query return all book likes
  """
  import Ecto.Query, only: [from: 2]

  alias GayaneLibrary.BookLikes.Entities.BookLike
  alias GayaneLibrary.Repo

  def process(book, params) do
    BookLike
    |> by_book(book.id)
    |> Repo.paginate(params)
  end

  defp by_book(query, book_id) do
    from book_like in query,
      where: book_like.book_id == ^book_id
  end
end
