defmodule GayaneLibrary.Accounts.Guardian.ErrorHandler do
  @moduledoc """
  The error_handler module requires an auth_error function that receives the conn, the reason tuple and the options.
  """
  use GayaneLibraryWeb, :controller

  alias GayaneLibrary.Changeset.Error
  alias GayaneLibraryWeb.ErrorView

  def auth_error(conn, {type, _reason}, _opts) do
    error =
      type
      |> to_string()
      |> Error.auth_error()

    conn
    |> put_status(401)
    |> put_view(ErrorView)
    |> render("401.json", error: error)
  end
end
