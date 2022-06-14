defmodule GayaneLibrary.Factories.Books.BookFactory do
  @moduledoc """
  Determines BookFactory for ExMachina
  """
  defmacro __using__(_opts) do
    quote do
      alias Faker.Lorem
      alias GayaneLibrary.Books.Entities.Book

      def book_factory(attrs) do
        author =
          Map.get(attrs, :author, Lorem.characters(8..32))
          |> to_string()

        name =
          Map.get(attrs, :name, Lorem.characters(8..32))
          |> to_string()

        text_content =
          Map.get(attrs, :text_content, Lorem.characters(8..1000))
          |> to_string()

        year = Map.get(attrs, :year, :rand.uniform(2022))

        edition =
          Map.get(attrs, :edition, Lorem.characters(8..32))
          |> to_string()

        hidden = Map.get(attrs, :hidden, false)
        user = Map.get(attrs, :user, insert(:user))
        tags = Map.get(attrs, :tags, [])

        %Book{
          author: author,
          name: name,
          text_content: text_content,
          year: year,
          edition: edition,
          hidden: hidden,
          user: user,
          tags: tags
        }
      end
    end
  end
end
