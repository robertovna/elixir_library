defmodule GayaneLibrary.Factories.CommentLikes.CommentLikeFactory do
  @moduledoc """
  Determines CommentLike for ExMachina
  """
  defmacro __using__(_opts) do
    quote do
      alias GayaneLibrary.CommentLikes.Entities.CommentLike

      def comment_like_factory(attrs) do
        user = Map.get(attrs, :user, insert(:user))
        comment = Map.get(attrs, :comment, insert(:comment))

        %CommentLike{
          user: user,
          comment: comment
        }
      end
    end
  end
end
