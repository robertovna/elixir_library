defmodule GayaneLibrary.Tags.Queries.ListTags do
  @moduledoc """
  ListTags Query return all tags
  """

  alias GayaneLibrary.Repo
  alias GayaneLibrary.Tags.Entities.TagEntity

  def process(params) do
    TagEntity
    |> Repo.paginate(params)
  end
end
