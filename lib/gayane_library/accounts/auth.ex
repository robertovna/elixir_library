defmodule GayaneLibrary.Accounts.Auth do
  @moduledoc """
  Auth module provides user authentifiactions
  """
  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Accounts.Services.Guardian

  def sign_user(%User{} = user), do: Guardian.sign(user)
end
