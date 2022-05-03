defmodule GayaneLibraryWeb.PageController do
  use GayaneLibraryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
