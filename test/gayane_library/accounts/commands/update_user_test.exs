defmodule GayaneLibrary.Accounts.Commands.UpdateUserTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Accounts

  test "process/1 update_user test" do
    user = insert(:user, %{email: "non_updated@email.com", password: "someSOME123*"})
    attrs = %{email: "update@em.com"}
    assert {:ok, updated_user} = Accounts.update_user(user, attrs)
    assert updated_user.email.address == attrs.email
  end
end
