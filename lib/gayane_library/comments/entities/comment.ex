defmodule GayaneLibrary.Comments.Entities.Comment do
  @moduledoc """
  Determines comments schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Books.Entities.Book
  alias GayaneLibrary.CommentLikes.Entities.CommentLike

  @required [
    :text_content,
    :user_id,
    :book_id
  ]

  schema "comments" do
    field :text_content, :string

    belongs_to :user, User
    belongs_to :book, Book

    has_many :likes, CommentLike

    timestamps()
  end

  def create_changeset(%__MODULE__{} = comment, attrs) do
    comment
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> assoc_constraint(:user)
    |> assoc_constraint(:book)
  end
end
