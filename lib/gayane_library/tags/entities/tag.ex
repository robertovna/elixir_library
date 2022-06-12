defmodule GayaneLibrary.Tags.Entities.TagEntity do
  @moduledoc """
  Determines tags schema
  """

  use Ecto.Schema

  import Ecto.Changeset

  @required [:name]

  @optional [:description]

  schema "tags" do
    field :name, :string
    field :description, :string

    timestamps()
  end

  def create_changeset(%__MODULE__{} = tag_entity, attrs) do
    tag_entity
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
    |> unique_constraint(:name, message: "taken")
  end
end
