defmodule GayaneLibraryWeb.V1.TagPolicy do
  @moduledoc """
  Describes tag policy for user actrions
  """
  @behaviour Bodyguard.Policy

  alias GayaneLibrary.Accounts.Entities.User

  def authorize(action, %User{id: _id}, _params)
      when action in [:show, :index, :create],
      do: :ok

  def authorize(_action, _user, _params), do: false
end
