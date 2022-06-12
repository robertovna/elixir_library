defmodule GayaneLibrary.Books.Commands.DeleteBookTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Books

  test "process/1 delete_book test" do
    book = insert(:book)
    assert {:ok, _result} = Books.delete_book(book)
    assert {:error, :not_found} = Books.get_book(book.id)
  end
end
