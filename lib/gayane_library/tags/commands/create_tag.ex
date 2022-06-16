defmodule GayaneLibrary.Tags.Commands.CreateTag do
  @moduledoc """
  Defines create tag command
  """

  alias GayaneLibrary.Repo
  alias GayaneLibrary.Tags.Entities.TagEntity

  def process(attrs) do
    %TagEntity{}
    |> TagEntity.create_changeset(attrs)
    |> Repo.insert()
  end
end
