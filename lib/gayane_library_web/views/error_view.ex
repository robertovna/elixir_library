defmodule GayaneLibraryWeb.ErrorView do
  use GayaneLibraryWeb, :view

  alias GayaneLibrary.Changeset.Error

  def render("404.json", %{}) do
    %{errors: ["Not found"]}
  end

  def render("403.json", %{message: message}) do
    %{errors: [message]}
  end

  def render("401.json", %{error: %Error{} = error}) do
    %{errors: [Map.from_struct(error)]}
  end
end
