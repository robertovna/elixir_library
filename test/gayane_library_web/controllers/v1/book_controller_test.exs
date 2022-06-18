defmodule GayaneLibraryWeb.V1.BookControllerTest do
  use GayaneLibraryWeb.ConnCase

  import GayaneLibraryWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user)
    conn = as_user(conn, user)
    {:ok, %{conn: conn, user: user}}
  end

  test "index/2 returns list books", %{conn: conn, user: user} do
    [book_1, book_2, book_3] = insert_list(3, :book, %{user: user})
    attrs = %{page: 1, page_size: 5}

    response =
      conn
      |> get(book_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             %{
               "entries" => [
                 %{"id" => book_1.id, "name" => book_1.name},
                 %{"id" => book_2.id, "name" => book_2.name},
                 %{"id" => book_3.id, "name" => book_3.name}
               ],
               "page_number" => 1,
               "page_size" => 5,
               "total_entries" => 3,
               "total_pages" => 1
             }
  end
end
