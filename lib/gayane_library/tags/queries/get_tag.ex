defmodule GayaneLibrary.Tags.Queries.GetTag do
  @moduledoc """
  GetTag Query find tag by id
  """

  alias GayaneLibrary.Repo
  alias GayaneLibrary.Tags.Entities.TagEntity

  def process(id) do
    Repo.find(TagEntity, id)
  end
end
