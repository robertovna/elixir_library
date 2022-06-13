defmodule GayaneLibrary.CommentLikes.Commands.ListCommentLikesTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.CommentLikes

  test "process/1 list_comment_likes test" do
    comment = insert(:comment)
    insert_list(10, :comment_like, %{comment: comment})
    result = CommentLikes.list_comment_likes(comment)
    assert length(result) == 10
  end
end
