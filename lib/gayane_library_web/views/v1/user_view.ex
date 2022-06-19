defmodule GayaneLibraryWeb.V1.UserView do
  use GayaneLibraryWeb, :view

  def render("create.json", %{
        user: user,
        access_token: access_token,
        refresh_token: refresh_token
      }) do
    %{
      access_token: access_token,
      refresh_token: refresh_token,
      user: %{
        email: user.email
      }
    }
  end

  def render("update.json", %{
        user: user
      }) do
    %{
      user: %{
        email: user.email
      }
    }
  end

  def render("delete.json", %{user: _user}) do
    %{
      message: "User successfully deleted!"
    }
  end
end
