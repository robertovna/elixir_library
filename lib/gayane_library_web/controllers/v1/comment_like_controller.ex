defmodule GayaneLibraryWeb.V1.CommentLikeController do
  use GayaneLibraryWeb, :controller

  alias GayaneLibrary.CommentLikes
  alias GayaneLibrary.Comments
  alias GayaneLibraryWeb.ApplyParams
  alias GayaneLibraryWeb.V1.CommentLikePolicy

  action_fallback(GayaneLibraryWeb.FallbackController)

  defmodule IndexCommentLikeListParams do
    use Params.Schema, %{
      comment_id!: :integer,
      page!: :integer,
      page_size!: :integer
    }
  end

  defmodule CreateCommentLikeParams do
    use Params.Schema, %{
      comment_id!: :integer
    }
  end

  def index(conn, params) do
    with {:ok, params} <- ApplyParams.do_apply(IndexCommentLikeListParams, params),
         {:ok, comment} <- Comments.get_comment(params.comment_id),
         page <- CommentLikes.list_comment_likes(comment, params) do
      conn
      |> put_status(:ok)
      |> render("index.json", %{page: page})
    end
  end

  def show(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, comment_like} <- CommentLikes.get_comment_like(id),
         :ok <- Bodyguard.permit(CommentLikePolicy, :show, current_user, comment_like) do
      render(conn, "show.json", %{comment_like: comment_like})
    end
  end

  def create(conn, %{"current_user" => current_user} = attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(CreateCommentLikeParams, attrs),
         attrs <- Map.put(attrs, :user_id, current_user.id),
         {:ok, comment_like} <- CommentLikes.create_comment_like(attrs) do
      conn
      |> put_status(:created)
      |> render("create.json", %{comment_like: comment_like})
    end
  end

  def delete(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, comment_like} <- CommentLikes.get_comment_like(id),
         :ok <- Bodyguard.permit(CommentLikePolicy, :delete, current_user, comment_like),
         {:ok, comment_like} <- CommentLikes.delete_comment_like(comment_like) do
      conn
      |> put_status(:ok)
      |> render("delete.json", %{comment_like: comment_like})
    end
  end
end
