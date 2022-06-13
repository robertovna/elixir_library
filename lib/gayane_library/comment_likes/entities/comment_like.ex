defmodule GayaneLibrary.CommentLikes.Entities.CommentLike do
  @moduledoc """
  Determines comments like schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias GayaneLibrary.Accounts.Entities.User
  alias GayaneLibrary.Comments.Entities.Comment

  @required [
    :user_id,
    :comment_id
  ]

  schema "comment_likes" do
    belongs_to :user, User
    belongs_to :comment, Comment

    timestamps()
  end

  def create_changeset(%__MODULE__{} = comment_like, attrs) do
    comment_like
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint([:user, :comment], message: "taken")
    |> assoc_constraint(:user)
    |> assoc_constraint(:comment)
  end
end
