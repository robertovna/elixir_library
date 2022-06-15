defmodule GayaneLibrary.Books.Entities.Book do
  @moduledoc """
  Determines books schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias GayaneLibrary.Repo
  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Tags.Entities.TagEntity
  alias GayaneLibrary.BookLikes.Entities.BookLike
  alias GayaneLibrary.Comments.Entities.Comment

  @required [
    :name,
    :text_content,
    :year,
    :user_id
  ]

  @optional [
    :author,
    :edition,
    :hidden
  ]

  schema "books" do
    field :author, :string
    field :name, :string
    field :text_content, :string
    field :year, :integer
    field :edition, :string
    field :hidden, :boolean

    belongs_to :user, User

    has_many :likes, BookLike
    has_many :comments, Comment

    many_to_many :tags, TagEntity, join_through: "books_tags"

    timestamps()
  end

  def create_changeset(%__MODULE__{} = book, attrs) do
    book
    |> Repo.preload(:tags)
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> validate_number(:year, greater_than_or_equal_to: 0)
    |> assoc_constraint(:user)
    |> put_tags(attrs)
  end

  def update_changeset(%__MODULE__{} = book, attrs) do
    book
    |> Repo.preload(:tags)
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> validate_number(:year, greater_than_or_equal_to: 0)
    |> assoc_constraint(:user)
    |> put_tags(attrs)
  end

  defp put_tags(changeset, attrs) do
    case Map.fetch(attrs, :tags) do
      {:ok, result} -> put_assoc(changeset, :tags, result)
      :error -> put_assoc(changeset, :tags, [])
    end
  end
end
