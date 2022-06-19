defmodule GayaneLibraryWeb.V1.BookLikeController do
  use GayaneLibraryWeb, :controller

  alias GayaneLibrary.BookLikes
  alias GayaneLibrary.Books
  alias GayaneLibraryWeb.ApplyParams
  alias GayaneLibraryWeb.V1.BookLikePolicy

  action_fallback(GayaneLibraryWeb.FallbackController)

  defmodule IndexBookLikeListParams do
    use Params.Schema, %{
      book_id!: :integer,
      page!: :integer,
      page_size!: :integer
    }
  end

  defmodule CreateBookLikeParams do
    use Params.Schema, %{
      book_id!: :integer
    }
  end

  def index(conn, params) do
    with {:ok, params} <- ApplyParams.do_apply(IndexBookLikeListParams, params),
         {:ok, book} <- Books.get_book(params.book_id),
         page <- BookLikes.list_book_likes(book, params) do
      conn
      |> put_status(:ok)
      |> render("index.json", %{page: page})
    end
  end

  def show(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, book_like} <- BookLikes.get_book_like(id),
         :ok <- Bodyguard.permit(BookLikePolicy, :show, current_user, book_like) do
      render(conn, "show.json", %{book_like: book_like})
    end
  end

  def create(conn, %{"current_user" => current_user} = attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(CreateBookLikeParams, attrs),
         attrs <- Map.put(attrs, :user_id, current_user.id),
         {:ok, book_like} <- BookLikes.create_book_like(attrs) do
      conn
      |> put_status(:created)
      |> render("create.json", %{book_like: book_like})
    end
  end

  def delete(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, book_like} <- BookLikes.get_book_like(id),
         :ok <- Bodyguard.permit(BookLikePolicy, :delete, current_user, book_like),
         {:ok, book_like} <- BookLikes.delete_book_like(book_like) do
      conn
      |> put_status(:ok)
      |> render("delete.json", %{book_like: book_like})
    end
  end
end
