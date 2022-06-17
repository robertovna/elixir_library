defmodule GayaneLibraryWeb.ErrorView do
  use GayaneLibraryWeb, :view

  def render("404.json", %{}) do
    %{errors: ["Not found"]}
  end

  def render("403.json", %{message: message}) do
    %{errors: [message]}
  end
end
