defmodule GayaneLibraryWeb.V1.CommentController do
  use GayaneLibraryWeb, :controller

  alias GayaneLibrary.Books
  alias GayaneLibrary.Comments
  alias GayaneLibraryWeb.ApplyParams

  action_fallback(GayaneLibraryWeb.FallbackController)

  defmodule IndexCommentListParams do
    use Params.Schema, %{
      book_id!: :integer,
      page!: :integer,
      page_size!: :integer
    }
  end

  defmodule CreateCommentParams do
    use Params.Schema, %{
      book_id!: :integer,
      text_content!: :string
    }
  end

  def index(conn, params) do
    with {:ok, params} <- ApplyParams.do_apply(IndexCommentListParams, params),
         {:ok, book} <- Books.get_book(params.book_id),
         page <- Comments.get_book_comments(book, params) do
      conn
      |> put_status(:ok)
      |> render("index.json", %{page: page})
    end
  end

  def show(conn, %{"current_user" => _current_user, "id" => id}) do
    with {:ok, comment} <- Comments.get_comment(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", %{comment: comment})
    end
  end

  def create(conn, %{"current_user" => current_user} = attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(CreateCommentParams, attrs),
         attrs <- Map.put(attrs, :user_id, current_user.id),
         {:ok, comment} <- Comments.create_comment(attrs) do
      conn
      |> put_status(:created)
      |> render("create.json", %{comment: comment})
    end
  end
end
