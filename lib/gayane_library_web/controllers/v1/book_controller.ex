defmodule GayaneLibraryWeb.V1.BookController do
  use GayaneLibraryWeb, :controller

  alias GayaneLibrary.Books

  action_fallback(GayaneLibraryWeb.FallbackController)

  def index(conn, params) do
    books = Books.list_books(params)
    render(conn, "index.json", %{books: books})
  end

  def show(conn, %{"id" => id}) do
    with {:ok, book} <- Books.get_book(id) do
      render(conn, "show.json", %{book: book})
    end
  end
end
