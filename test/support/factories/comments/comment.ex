defmodule GayaneLibrary.Factories.Comments.CommentFactory do
  @moduledoc """
  Determines CommentFactory for ExMachina
  """
  defmacro __using__(_opts) do
    quote do
      alias Faker.Lorem
      alias GayaneLibrary.Comments.Entities.Comment

      def comment_factory(attrs) do
        text_content =
          Map.get(attrs, :text_content, Lorem.characters(8..1000))
          |> to_string()

        user = Map.get(attrs, :user, insert(:user))
        book = Map.get(attrs, :book, insert(:book))

        %Comment{
          text_content: text_content,
          user: user,
          book: book
        }
      end
    end
  end
end
