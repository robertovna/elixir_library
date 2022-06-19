defmodule GayaneLibrary.Comments.Queries.GetBookComments do
  @moduledoc """
  GetBookComments Query returns books comments
  """
  import Ecto.Query, only: [from: 2]

  alias GayaneLibrary.Comments.Entities.Comment
  alias GayaneLibrary.Repo

  def process(book, params) do
    Comment
    |> by_book(book.id)
    |> order_comments()
    |> Repo.paginate(params)
  end

  defp by_book(query, book_id) do
    from comment in query,
      where: comment.book_id == ^book_id
  end

  defp order_comments(query) do
    from comment in query,
      order_by: [asc: :inserted_at]
  end
end
