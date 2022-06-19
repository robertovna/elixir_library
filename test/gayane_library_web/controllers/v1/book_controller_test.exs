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

  test "create/2 creates book", %{conn: conn, user: user} do
    attrs = %{
      "name" => "Some book name",
      "text_content" => "I am text content. Read me!",
      "year" => 1233,
      "author" => "Some Author",
      "edition" => "My Studio"
    }

    response =
      conn
      |> post(book_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "name" => attrs["name"],
             "text_content" => attrs["text_content"],
             "year" => attrs["year"],
             "author" => attrs["author"],
             "user_id" => user.id,
             "edition" => attrs["edition"],
             "id" => response["id"]
           }
  end

  test "create/2 creates book with error", %{conn: conn} do
    attrs = %{
      "name" => "",
      "text_content" => "I am text content. Read me!",
      "year" => 1233,
      "author" => "Some Author",
      "edition" => "My Studio"
    }

    response =
      conn
      |> post(book_path(conn, :create), attrs)
      |> json_response(422)

    assert response == %{"errors" => [%{"code" => "can't be blank", "field" => "name"}]}
  end

  test "update/2 update book", %{conn: conn, user: user} do
    book = insert(:book, %{user: user})

    attrs = %{
      "name" => "Some book name"
    }

    response =
      conn
      |> patch(book_path(conn, :update, book, attrs))
      |> json_response(200)

    assert response == %{
             "name" => attrs["name"],
             "text_content" => book.text_content,
             "year" => book.year,
             "author" => book.author,
             "user_id" => user.id,
             "edition" => book.edition,
             "id" => book.id
           }
  end

  test "update/2 update book with other user", %{conn: conn, user: _user} do
    other_user = insert(:user)
    book = insert(:book, %{user: other_user})

    attrs = %{
      "name" => "Some book name"
    }

    response =
      conn
      |> patch(book_path(conn, :update, book, attrs))
      |> json_response(403)

    assert response == %{"errors" => ["You are not authorized to perform this action."]}
  end

  test "delete/1 delete book", %{conn: conn, user: user} do
    book = insert(:book, %{user: user})

    response =
      conn
      |> delete(book_path(conn, :delete, book))
      |> json_response(200)

    assert response == %{"name" => book.name, "message" => "Book successfully deleted!"}
  end

  test "delete/1 delete book with other user", %{conn: conn, user: _user} do
    other_user = insert(:user)
    book = insert(:book, %{user: other_user})

    response =
      conn
      |> delete(book_path(conn, :delete, book))
      |> json_response(403)

    assert response == %{"errors" => ["You are not authorized to perform this action."]}
  end
end
