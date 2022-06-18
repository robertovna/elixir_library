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
end
