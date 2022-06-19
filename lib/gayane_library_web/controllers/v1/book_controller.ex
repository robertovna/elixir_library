defmodule GayaneLibraryWeb.V1.BookController do
  use GayaneLibraryWeb, :controller

  alias GayaneLibrary.Books
  alias GayaneLibraryWeb.ApplyParams
  alias GayaneLibraryWeb.V1.BookPolicy

  action_fallback(GayaneLibraryWeb.FallbackController)

  defmodule IndexBookSearchParams do
    use Params.Schema, %{
      name: :string,
      author: :string,
      edition: :string,
      year_greater_than: :integer,
      likes_greater_than: :integer,
      tags: [
        %{
          name: :string,
          description: :string
        }
      ],
      page!: :integer,
      page_size!: :integer
    }
  end

  defmodule CreateBookParams do
    use Params.Schema, %{
      name!: :string,
      author: :string,
      edition: :string,
      text_content!: :string,
      year!: :integer,
      tags: [
        %{
          name: :string,
          description: :string
        }
      ]
    }
  end

  defmodule UpdateBookParams do
    use Params.Schema, %{
      name: :string,
      author: :string,
      edition: :string,
      text_content: :string,
      year: :integer,
      tags: [
        %{
          name: :string,
          description: :string
        }
      ]
    }
  end

  def index(conn, params) do
    with {:ok, params} <- ApplyParams.do_apply(IndexBookSearchParams, params) do
      page = Books.list_books(params)
      render(conn, "index.json", %{page: page})
    end
  end

  def show(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, book} <- Books.get_book(id),
         :ok <- Bodyguard.permit(BookPolicy, :show, current_user, book) do
      render(conn, "show.json", %{book: book})
    end
  end

  def create(conn, %{"current_user" => current_user} = attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(CreateBookParams, attrs),
         attrs <- Map.put(attrs, :user_id, current_user.id),
         {:ok, book} <- Books.create_book(attrs) do
      conn
      |> put_status(:created)
      |> render("create.json", %{book: book})
    end
  end

  def update(conn, %{"current_user" => current_user, "id" => id} = attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(UpdateBookParams, attrs),
         attrs <- Map.put(attrs, :user_id, current_user.id),
         {:ok, book} <- Books.get_book(id),
         :ok <- Bodyguard.permit(BookPolicy, :update, current_user, book),
         {:ok, book} <- Books.update_book(book, attrs) do
      conn
      |> put_status(:ok)
      |> render("update.json", %{book: book})
    end
  end

  def delete(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, book} <- Books.get_book(id),
         :ok <- Bodyguard.permit(BookPolicy, :delete, current_user, book),
         {:ok, book} <- Books.delete_book(book) do
      conn
      |> put_status(:ok)
      |> render("delete.json", %{book: book})
    end
  end
end
