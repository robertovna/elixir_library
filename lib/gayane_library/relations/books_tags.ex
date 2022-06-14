defmodule BookTag do
  @moduledoc """
  Determines booktag shema - relation between books and tags
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias GayaneLibrary.Books.Entities.Book
  alias GayaneLibrary.Tags.Entities.TagEntity

  @required [
    :book_id,
    :tag_entity_id
  ]

  @primary_key false
  schema "books_tags" do
    belongs_to :book, Book
    belongs_to :tag_entity, TagEntity

    timestamps()
  end

  def changeset(%__MODULE__{} = book_tag, attrs \\ %{}) do
    book_tag
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> assoc_constraint(:book)
    |> assoc_constraint(:tag_entity)
    |> unique_constraint([:book, :tag_entity], message: "taken")
  end
end
