defmodule GayaneLibrary.Comments.Commands.CreateComment do
  @moduledoc """
  Defines create comment command
  """

  alias GayaneLibrary.Comments.Entities.Comment
  alias GayaneLibrary.Repo

  def process(attrs) do
    %Comment{}
    |> Comment.create_changeset(attrs)
    |> Repo.insert()
  end
end
