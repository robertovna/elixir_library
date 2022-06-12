defmodule GayaneLibrary.Comments.Queries.GetBookCommentsTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Comments

  test "process/1 get comments by book" do
    book = insert(:book)
    insert(:comment, %{book: book})
    result = Comments.get_book_comments(book)
    result_comment = List.first(result)
    assert book.id == result_comment.book_id
  end
end
