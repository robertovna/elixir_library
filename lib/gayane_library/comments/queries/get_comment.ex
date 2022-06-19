defmodule GayaneLibrary.Comments.Queries.GetComment do
  @moduledoc """
  GetComment Query find comment by id
  """

  alias GayaneLibrary.Comments.Entities.Comment
  alias GayaneLibrary.Repo

  def process(id) do
    Repo.find(Comment, id)
  end
end
