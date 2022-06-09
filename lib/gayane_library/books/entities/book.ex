defmodule GayaneLibrary.Books.Entities.Book do
  @moduledoc """
  Determines books schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias GayaneLibrary.Accounts.Entities.User

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

    timestamps()
  end

  def create_changeset(%__MODULE__{} = book, attrs) do
    book
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> validate_number(:year, greater_than_or_equal_to: 0)
    |> assoc_constraint(:user)
  end

  def update_changeset(%__MODULE__{} = book, attrs) do
    book
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> validate_number(:year, greater_than_or_equal_to: 0)
    |> assoc_constraint(:user)
  end
end
