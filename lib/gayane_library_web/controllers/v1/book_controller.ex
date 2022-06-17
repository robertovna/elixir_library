defmodule GayaneLibraryWeb.V1.BookController do
  use GayaneLibraryWeb, :controller

  alias GayaneLibrary.Books
  alias GayaneLibraryWeb.V1.BookPolicy

  action_fallback(GayaneLibraryWeb.FallbackController)

  def index(conn, params) do
    books = Books.list_books(params)
    render(conn, "index.json", %{books: books})
  end

  def show(conn, %{"id" => id}) do
    user = conn.assigns.current_user

    with {:ok, book} <- Books.get_book(id),
         :ok <- Bodyguard.permit(BookPolicy, :show, user, book) do
      render(conn, "show.json", %{book: book})
    end
  end
end
