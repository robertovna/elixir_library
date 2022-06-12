defmodule GayaneLibrary.Tags.Commands.CreateTag do
  @moduledoc """
  Defines create tag command
  """

  alias GayaneLibrary.Tags.Entities.TagEntity
  alias GayaneLibrary.Repo

  def process(attrs) do
    %TagEntity{}
    |> TagEntity.create_changeset(attrs)
    |> Repo.insert()
  end
end
