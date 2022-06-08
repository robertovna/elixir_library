defmodule GayaneLibrary.Accounts.Queries.GetUserTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Accounts

  test "process/1 get user by id" do
    user = insert(:user)
    assert {:ok, result} = Accounts.get_user(user.id)
    assert user.id == result.id
  end
end
