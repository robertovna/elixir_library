defmodule GayaneLibraryWeb.V1.CommentControllerTest do
  use GayaneLibraryWeb.ConnCase

  import GayaneLibraryWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user)
    conn = as_user(conn, user)
    {:ok, %{conn: conn, user: user}}
  end

  test "index/2 returns list comments", %{conn: conn} do
    book = insert(:book)
    [comment_1, comment_2, comment_3] = insert_list(3, :comment, %{book: book})
    attrs = %{book_id: book.id, page: 1, page_size: 5}

    response =
      conn
      |> get(comment_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             %{
               "entries" => [
                 %{"id" => comment_1.id, "text_content" => comment_1.text_content},
                 %{"id" => comment_2.id, "text_content" => comment_2.text_content},
                 %{"id" => comment_3.id, "text_content" => comment_3.text_content}
               ],
               "page_number" => 1,
               "page_size" => 5,
               "total_entries" => 3,
               "total_pages" => 1
             }
  end

  test "create/2 creates comment", %{conn: conn} do
    book = insert(:book)

    attrs = %{
      "text_content" => "Some comment text_content",
      "book_id" => book.id
    }

    response =
      conn
      |> post(comment_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "text_content" => attrs["text_content"],
             "id" => response["id"]
           }
  end

  test "create/2 creates comment with error", %{conn: conn} do
    attrs = %{
      "text_content" => "",
      "book_id" => 11
    }

    response =
      conn
      |> post(comment_path(conn, :create), attrs)
      |> json_response(422)

    assert response == %{"errors" => [%{"code" => "can't be blank", "field" => "text_content"}]}
  end

  test "show/2 show comment", %{conn: conn} do
    comment = insert(:comment)

    response =
      conn
      |> get(comment_path(conn, :show, comment))
      |> json_response(200)

    assert response == %{
             "text_content" => comment.text_content,
             "id" => comment.id
           }
  end
end
