defmodule GayaneLibrary.Books.Queries.GetBookTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Books

  test "process/1 get book by id" do
    book = insert(:book)
    assert {:ok, result} = Books.get_book(book.id)
    assert book.id == result.id
  end
end
