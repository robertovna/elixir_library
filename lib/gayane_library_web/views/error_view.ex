defmodule GayaneLibraryWeb.ErrorView do
  use GayaneLibraryWeb, :view

  def render("404.json", %{}) do
    %{errors: ["Not found"]}
  end
end
