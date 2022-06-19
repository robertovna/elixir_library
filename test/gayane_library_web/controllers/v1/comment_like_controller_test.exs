defmodule GayaneLibraryWeb.V1.CommentLikeControllerTest do
  use GayaneLibraryWeb.ConnCase

  import GayaneLibraryWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user)
    conn = as_user(conn, user)
    {:ok, %{conn: conn, user: user}}
  end

  @tag :kek
  test "index/2 returns list comment likes", %{conn: conn} do
    comment = insert(:comment)

    [comment_like_1, comment_like_2, comment_like_3] =
      insert_list(3, :comment_like, %{comment: comment})

    attrs = %{comment_id: comment.id, page: 1, page_size: 5}

    response =
      conn
      |> get(comment_like_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             %{
               "entries" => [
                 %{"id" => comment_like_1.id, "user_id" => comment_like_1.user_id},
                 %{"id" => comment_like_2.id, "user_id" => comment_like_2.user_id},
                 %{"id" => comment_like_3.id, "user_id" => comment_like_3.user_id}
               ],
               "page_number" => 1,
               "page_size" => 5,
               "total_entries" => 3,
               "total_pages" => 1
             }
  end

  test "create/2 creates comment like", %{conn: conn, user: user} do
    comment = insert(:comment)

    attrs = %{
      "user_id" => user.id,
      "comment_id" => comment.id
    }

    response =
      conn
      |> post(comment_like_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "user_id" => attrs["user_id"],
             "comment_id" => attrs["comment_id"],
             "id" => response["id"]
           }
  end

  test "create/2 creates comment like with error", %{conn: conn} do
    insert(:comment_like)

    attrs = %{
      "comment_id" => ""
    }

    response =
      conn
      |> post(comment_like_path(conn, :create), attrs)
      |> json_response(422)

    assert response == %{"errors" => [%{"code" => "can't be blank", "field" => "comment_id"}]}
  end

  test "show/2 show comment like", %{conn: conn} do
    comment_like = insert(:comment_like)

    response =
      conn
      |> get(comment_like_path(conn, :show, comment_like))
      |> json_response(200)

    assert response == %{
             "user_id" => comment_like.user_id,
             "id" => comment_like.id
           }
  end

  test "delete/1 delete comment like", %{conn: conn, user: user} do
    comment_like = insert(:comment_like, %{user: user})

    response =
      conn
      |> delete(comment_like_path(conn, :delete, comment_like))
      |> json_response(200)

    assert response == %{
             "user_id" => comment_like.user_id,
             "message" => "CommentLike successfully deleted!"
           }
  end

  test "delete/1 delete comment like with other user", %{conn: conn} do
    other_user = insert(:user)
    comment_like = insert(:comment_like, %{user: other_user})

    response =
      conn
      |> delete(comment_like_path(conn, :delete, comment_like))
      |> json_response(403)

    assert response == %{"errors" => ["You are not authorized to perform this action."]}
  end
end
