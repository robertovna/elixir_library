defmodule GayaneLibrary.Accounts.Queries.ListUsersTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Accounts

  test "process/1 list_users test" do
    insert_list(10, :user)
    %{entries: result} = Accounts.list_users()
    assert length(result) == 10
  end
end
