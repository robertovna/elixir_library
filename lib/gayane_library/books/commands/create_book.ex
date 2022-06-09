defmodule GayaneLibrary.Books.Commands.CreateBook do
  @moduledoc """
  Defines create book command
  """

  alias GayaneLibrary.Books.Entities.Book
  alias GayaneLibrary.Repo

  def process(attrs) do
    %Book{}
    |> Book.create_changeset(attrs)
    |> Repo.insert()
  end
end
