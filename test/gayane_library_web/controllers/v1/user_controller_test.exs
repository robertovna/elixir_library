defmodule GayaneLibraryWeb.V1.UserControllerTest do
  use GayaneLibraryWeb.ConnCase

  import GayaneLibraryWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user)
    conn = as_user(conn, user)
    {:ok, %{conn: conn, user: user}}
  end

  test "create/2 creates user", %{conn: conn} do
    attrs = %{
      "email" => "tester@mail.com",
      "password" => "testPassword1"
    }

    response =
      conn
      |> post(user_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "access_token" => response["access_token"],
             "refresh_token" => response["refresh_token"],
             "user" => %{
               "email" => attrs["email"]
             }
           }
  end

  test "update/2 update user", %{conn: conn, user: user} do
    attrs = %{
      "email" => "gayane@mail.com"
    }

    response =
      conn
      |> patch(user_path(conn, :update, user, attrs))
      |> json_response(200)

    assert response == %{
             "user" => %{
               "email" => attrs["email"]
             }
           }
  end

  test "delete/1 delete user", %{conn: conn, user: user} do
    response =
      conn
      |> delete(user_path(conn, :delete, user))
      |> json_response(200)

    assert response == %{"message" => "User successfully deleted!"}
  end
end
