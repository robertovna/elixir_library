
defmodule GayaneLibrary.BookLikes.Commands.DeleteBookLikeTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.BookLikes

  test "process/1 delete_book_like test" do
    book_like = insert(:book_like)
    assert {:ok, _result} = BookLikes.delete_book_like(book_like)
    assert {:error, :not_found} = BookLikes.get_book_like(book_like.id)
  end
end
