defmodule GayaneLibraryWeb.V1.TagControllerTest do
  use GayaneLibraryWeb.ConnCase

  import GayaneLibraryWeb.Router.Helpers

  setup %{conn: conn} do
    user = insert(:user)
    conn = as_user(conn, user)
    {:ok, %{conn: conn, user: user}}
  end

  test "index/2 returns list tags", %{conn: conn} do
    [tag_1, tag_2, tag_3] = insert_list(3, :tag)
    attrs = %{page: 1, page_size: 5}

    response =
      conn
      |> get(tag_path(conn, :index), attrs)
      |> json_response(200)

    assert response ==
             %{
               "entries" => [
                 %{"id" => tag_1.id, "name" => tag_1.name},
                 %{"id" => tag_2.id, "name" => tag_2.name},
                 %{"id" => tag_3.id, "name" => tag_3.name}
               ],
               "page_number" => 1,
               "page_size" => 5,
               "total_entries" => 3,
               "total_pages" => 1
             }
  end

  test "create/2 creates tag", %{conn: conn} do
    attrs = %{
      "name" => "Some tag name",
      "description" => "I am text content. Read me!"
    }

    response =
      conn
      |> post(tag_path(conn, :create), attrs)
      |> json_response(201)

    assert response == %{
             "name" => attrs["name"],
             "description" => attrs["description"],
             "id" => response["id"]
           }
  end

  test "create/2 creates tag with error", %{conn: conn} do
    attrs = %{
      "name" => "",
      "description" => "I am text content. Read me!"
    }

    response =
      conn
      |> post(tag_path(conn, :create), attrs)
      |> json_response(422)

    assert response == %{"errors" => [%{"code" => "can't be blank", "field" => "name"}]}
  end

  test "show/2 show tag", %{conn: conn} do
    tag = insert(:tag)

    response =
      conn
      |> get(tag_path(conn, :show, tag))
      |> json_response(200)

    assert response == %{
             "name" => tag.name,
             "id" => tag.id
           }
  end
end
