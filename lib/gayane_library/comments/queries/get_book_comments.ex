defmodule GayaneLibrary.Comments.Queries.GetBookComments do
  @moduledoc """
  GetBookComments Query returns books comments
  """
  import Ecto.Query, only: [from: 2]

  alias GayaneLibrary.Comments.Entities.Comment
  alias GayaneLibrary.Repo

  def process(book) do
    Comment
    |> by_book(book.id)
    |> select_fields()
    |> Repo.all()
  end

  defp by_book(query, book_id) do
    from comment in query,
      where: comment.book_id == ^book_id
  end

  defp select_fields(query) do
    from comment in query,
      order_by: [asc: :inserted_at],
      select: %{id: comment.id, user_id: comment.user_id, book_id: comment.book_id}
  end
end
