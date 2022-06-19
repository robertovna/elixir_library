defmodule GayaneLibraryWeb.V1.BookLikeView do
  use GayaneLibraryWeb, :view

  def render("index.json", %{page: page}) do
    %{
      entries: render_many(page.entries, __MODULE__, "show.json", as: :book_like),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{book_like: book_like}) do
    %{
      id: book_like.id,
      user_id: book_like.user_id
    }
  end

  def render("create.json", %{book_like: book_like}) do
    %{
      id: book_like.id,
      book_id: book_like.book_id,
      user_id: book_like.user_id
    }
  end

  def render("delete.json", %{book_like: book_like}) do
    %{
      message: "BookLike successfully deleted!",
      user_id: book_like.user_id
    }
  end
end
