defmodule GayaneLibrary.BookLikes.Commands.CreateBookLike do
  @moduledoc """
  Defines create book like command
  """

  alias GayaneLibrary.BookLikes.Entities.BookLike
  alias GayaneLibrary.Repo

  def process(attrs) do
    %BookLike{}
    |> BookLike.create_changeset(attrs)
    |> Repo.insert()
  end
end
