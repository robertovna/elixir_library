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
end
