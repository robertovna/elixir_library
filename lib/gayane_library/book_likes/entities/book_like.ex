defmodule GayaneLibrary.BookLikes.Entities.BookLike do
  @moduledoc """
  Determines books like schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Books.Entities.Book

  @required [
    :user_id,
    :book_id
  ]

  schema "book_likes" do
    belongs_to :user, User
    belongs_to :book, Book

    timestamps()
  end

  def create_changeset(%__MODULE__{} = book_like, attrs) do
    book_like
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint([:user, :book], message: "taken")
    |> assoc_constraint(:user)
    |> assoc_constraint(:book)
  end
end
