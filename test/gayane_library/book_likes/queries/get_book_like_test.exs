defmodule GayaneLibrary.BookLikes.Commands.GetBookLikesTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.BookLikes

  test "process/1 get_book_like test" do
    book_like = insert(:book_like)
    assert {:ok, result} = BookLikes.get_book_like(book_like.id)
    assert result.id == book_like.id
  end
end
