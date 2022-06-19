defmodule GayaneLibraryWeb.V1.BookView do
  use GayaneLibraryWeb, :view

  def render("index.json", %{page: page}) do
    %{
      entries: render_many(page.entries, __MODULE__, "show.json", as: :book),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{book: book}) do
    %{
      id: book.id,
      name: book.name
    }
  end

  def render("create.json", %{book: book}) do
    %{
      id: book.id,
      name: book.name,
      edition: book.edition,
      text_content: book.text_content,
      year: book.year,
      user_id: book.user_id,
      author: book.author
    }
  end

  def render("update.json", %{book: book}) do
    %{
      id: book.id,
      name: book.name,
      edition: book.edition,
      text_content: book.text_content,
      year: book.year,
      user_id: book.user_id,
      author: book.author
    }
  end
end
