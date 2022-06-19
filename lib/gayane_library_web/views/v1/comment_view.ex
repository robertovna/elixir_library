defmodule GayaneLibraryWeb.V1.CommentView do
  use GayaneLibraryWeb, :view

  def render("index.json", %{page: page}) do
    %{
      entries: render_many(page.entries, __MODULE__, "show.json", as: :comment),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{comment: comment}) do
    %{
      id: comment.id,
      text_content: comment.text_content
    }
  end

  def render("create.json", %{comment: comment}) do
    %{
      id: comment.id,
      text_content: comment.text_content
    }
  end
end
