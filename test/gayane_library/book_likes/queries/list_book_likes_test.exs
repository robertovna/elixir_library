defmodule GayaneLibrary.BookLikes.Commands.ListBookLikesTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.BookLikes

  test "process/1 list_book_likes test" do
    book = insert(:book)
    insert_list(10, :book_like, %{book: book})
    %{entries: result} = BookLikes.list_book_likes(book)
    assert length(result) == 10
  end
end
