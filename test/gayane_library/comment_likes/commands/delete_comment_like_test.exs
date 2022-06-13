defmodule GayaneLibrary.CommentLikes.Commands.DeleteCommentLikeTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.CommentLikes

  test "process/1 delete_comment_like test" do
    comment_like = insert(:comment_like)
    assert {:ok, _result} = CommentLikes.delete_comment_like(comment_like)
    assert {:error, :not_found} = CommentLikes.get_comment_like(comment_like.id)
  end
end
