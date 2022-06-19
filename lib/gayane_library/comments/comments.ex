defmodule GayaneLibrary.Comments do
  @moduledoc """
  Describes the context of the comment
  """

  alias GayaneLibrary.Comments.Commands.CreateComment

  alias GayaneLibrary.Comments.Queries.{
    GetBookComments,
    GetComment
  }

  # Commands
  defdelegate create_comment(attrs), to: CreateComment, as: :process

  # Queries
  defdelegate get_book_comments(book, params \\ %{}), to: GetBookComments, as: :process
  defdelegate get_comment(id), to: GetComment, as: :process
end
