defmodule GayaneLibrary.Factories.BookLikes.BookLikeFactory do
  @moduledoc """
  Determines BookLike for ExMachina
  """
  defmacro __using__(_opts) do
    quote do
      alias GayaneLibrary.BookLikes.Entities.BookLike

      def book_like_factory(attrs) do
        user = Map.get(attrs, :user, insert(:user))
        book = Map.get(attrs, :book, insert(:book))

        %BookLike{
          user: user,
          book: book
        }
      end
    end
  end
end
