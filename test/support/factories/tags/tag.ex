defmodule GayaneLibrary.Factories.Tags.TagFactory do
  @moduledoc """
  Determines TagFactory for ExMachina
  """
  defmacro __using__(_opts) do
    quote do
      alias Faker.Lorem
      alias GayaneLibrary.Tags.Entities.TagEntity

      def tag_factory(attrs) do
        name =
          Map.get(attrs, :name, Lorem.characters(8..32))
          |> to_string()

        description =
          Map.get(attrs, :description, Lorem.characters(8..100))
          |> to_string()

        %TagEntity{
          name: name,
          description: description
        }
      end
    end
  end
end
