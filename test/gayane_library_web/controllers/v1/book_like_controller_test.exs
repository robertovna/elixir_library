defmodule GayaneLibraryWeb.V1.BookLikeControllerTest do
  use GayaneLibraryWeb.ConnCase

  import GayaneLibraryWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user)
    conn = as_user(conn, user)
    {:ok, %{conn: conn, user: user}}
  end

  test "index/2 returns list book likes", %{conn: conn, user: _user} do
    book = insert(:book)
    [book_like_1, book_like_2, book_like_3] = insert_list(3, :book_like, %{book: book})
    attrs = %{book_id: book.id, page: 1, page_size: 5}

    response =
      conn
      |> get(book_like_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             %{
               "entries" => [
                 %{"id" => book_like_1.id, "user_id" => book_like_1.user_id},
                 %{"id" => book_like_2.id, "user_id" => book_like_2.user_id},
                 %{"id" => book_like_3.id, "user_id" => book_like_3.user_id}
               ],
               "page_number" => 1,
               "page_size" => 5,
               "total_entries" => 3,
               "total_pages" => 1
             }
  end

  test "create/2 creates book like", %{conn: conn, user: user} do
    book = insert(:book)

    attrs = %{
      "user_id" => user.id,
      "book_id" => book.id
    }

    response =
      conn
      |> post(book_like_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "user_id" => attrs["user_id"],
             "book_id" => attrs["book_id"],
             "id" => response["id"]
           }
  end

  test "create/2 creates book like with error", %{conn: conn} do
    insert(:book_like)

    attrs = %{
      "book_id" => ""
    }

    response =
      conn
      |> post(book_like_path(conn, :create), attrs)
      |> json_response(422)

    assert response == %{"errors" => [%{"code" => "can't be blank", "field" => "book_id"}]}
  end

  test "show/2 show book like", %{conn: conn} do
    book_like = insert(:book_like)

    response =
      conn
      |> get(book_like_path(conn, :show, book_like))
      |> json_response(200)

    assert response == %{
             "user_id" => book_like.user_id,
             "id" => book_like.id
           }
  end

  test "delete/1 delete book like", %{conn: conn, user: user} do
    book_like = insert(:book_like, %{user: user})

    response =
      conn
      |> delete(book_like_path(conn, :delete, book_like))
      |> json_response(200)

    assert response == %{
             "user_id" => book_like.user_id,
             "message" => "BookLike successfully deleted!"
           }
  end

  test "delete/1 delete book like with other user", %{conn: conn} do
    other_user = insert(:user)
    book_like = insert(:book_like, %{user: other_user})

    response =
      conn
      |> delete(book_like_path(conn, :delete, book_like))
      |> json_response(403)

    assert response == %{"errors" => ["You are not authorized to perform this action."]}
  end
end
