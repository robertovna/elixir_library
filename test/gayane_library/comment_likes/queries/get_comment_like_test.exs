defmodule GayaneLibrary.CommentLikes.Commands.GetCommentLikesTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.CommentLikes

  test "process/1 get_comment_like test" do
    comment_like = insert(:comment_like)
    assert {:ok, result} = CommentLikes.get_comment_like(comment_like.id)
    assert result.id == comment_like.id
  end
end
