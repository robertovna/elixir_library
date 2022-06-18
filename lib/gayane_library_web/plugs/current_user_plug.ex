defmodule GayaneLibraryWeb.CurrentUserPlug do
  @moduledoc """
  CurrentUserPlug plug expands conn with current_user inform
  """
  import Plug.Conn

  alias GayaneLibrary.Accounts.Services.Guardian

  def init(opts), do: opts

  def call(%Plug.Conn{params: params} = conn, _opts) do
    case Guardian.current_user(conn) do
      {:ok, user} ->
        %{conn | params: Map.put(params, "current_user", user)}

      _ ->
        conn
        |> send_resp(401, "Access denied")
        |> halt()
    end
  end
end
