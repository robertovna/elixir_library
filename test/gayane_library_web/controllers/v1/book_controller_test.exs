defmodule GayaneLibraryWeb.V1.BookControllerTest do
  use GayaneLibraryWeb.ConnCase

  import GayaneLibraryWeb.Router.Helpers

  setup %{conn: conn} do
    {:ok, %{conn: conn}}
  end

  test "index/2 returns list books", %{conn: conn} do
    [book_1, book_2, book_3] = insert_list(3, :book)

    response =
      conn
      |> get(book_path(conn, :index))
      |> json_response(200)

    assert response ==
             [
               %{"id" => book_1.id, "name" => book_1.name},
               %{"id" => book_2.id, "name" => book_2.name},
               %{"id" => book_3.id, "name" => book_3.name}
             ]
  end
end
