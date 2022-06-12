defmodule GayaneLibrary.Books.Queries.ListBooksTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Books

  test "process/1 list_books test" do
    insert_list(10, :book)
    result = Books.list_books()
    assert length(result) == 10
  end
end
