defmodule GayaneLibraryWeb.V1.CommentLikeView do
  use GayaneLibraryWeb, :view

  def render("index.json", %{page: page}) do
    %{
      entries: render_many(page.entries, __MODULE__, "show.json", as: :comment_like),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{comment_like: comment_like}) do
    %{
      id: comment_like.id,
      user_id: comment_like.user_id
    }
  end

  def render("create.json", %{comment_like: comment_like}) do
    %{
      id: comment_like.id,
      comment_id: comment_like.comment_id,
      user_id: comment_like.user_id
    }
  end

  def render("delete.json", %{comment_like: comment_like}) do
    %{
      message: "CommentLike successfully deleted!",
      user_id: comment_like.user_id
    }
  end
end
