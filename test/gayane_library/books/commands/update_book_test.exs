defmodule GayaneLibrary.Books.Commands.UpdateBookTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Books

  test "process/1 update_book test" do
    book = insert(:book, %{name: "some"})
    attrs = %{name: "updated_name"}
    assert {:ok, updated_book} = Books.update_book(book, attrs)
    assert updated_book.name == attrs.name
  end
end
