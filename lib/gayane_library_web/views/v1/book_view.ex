defmodule GayaneLibraryWeb.V1.BookView do
  use GayaneLibraryWeb, :view

  def render("index.json", %{books: books}) do
    render_many(books, __MODULE__, "show.json", as: :book)
  end

  def render("show.json", %{book: book}) do
    %{
      id: book.id,
      name: book.name
    }
  end
end
