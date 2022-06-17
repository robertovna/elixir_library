defmodule GayaneLibrary.Books.Queries.ListBooks do
  @moduledoc """
  ListBooks Query return all book
  """
  import Ecto.Query, only: [from: 2]

  alias GayaneLibrary.Books.Entities.Book
  alias GayaneLibrary.Repo

  def process(params) do
    Book
    |> with_tags(params)
    |> with_name(params)
    |> with_author(params)
    |> with_edition(params)
    |> with_year(params)
    |> with_greater_likes(params)
    |> Repo.paginate(params)
  end

  defp with_name(query, %{name: nil}), do: query

  defp with_name(query, %{name: name}) when is_binary(name) do
    name = "%" <> String.trim(name) <> "%"

    from book in query,
      where: ilike(book.name, ^name)
  end

  defp with_name(query, _), do: query

  defp with_author(query, %{author: nil}), do: query

  defp with_author(query, %{author: author}) when is_binary(author) do
    author = "%" <> String.trim(author) <> "%"

    from book in query,
      where: ilike(book.author, ^author)
  end

  defp with_author(query, _), do: query

  defp with_year(query, %{year_greater_than: nil}), do: query

  defp with_year(query, %{year_greater_than: year}) do
    from book in query,
      where: book.year > ^year
  end

  defp with_year(query, _), do: query

  defp with_edition(query, %{edition: nil}), do: query

  defp with_edition(query, %{edition: edition}) when is_binary(edition) do
    edition = "%" <> String.trim(edition) <> "%"

    from book in query,
      where: ilike(book.edition, ^edition)
  end

  defp with_edition(query, _), do: query

  defp with_greater_likes(query, %{likes_greater_than: nil}), do: query

  defp with_greater_likes(query, %{likes_greater_than: likes_count}) do
    from book in query,
      join: like in assoc(book, :likes),
      group_by: book.id,
      having: count(like) > ^likes_count
  end

  defp with_greater_likes(query, _), do: query

  defp get_tag_name(tag), do: tag.name

  defp with_tags(query, %{tags: nil}), do: query

  defp with_tags(query, %{tags: []}), do: query

  defp with_tags(query, %{tags: tags}) when is_list(tags) do
    tags = Enum.map(tags, &get_tag_name/1)

    from book in query,
      join: tag in assoc(book, :tags),
      preload: [tags: tag],
      where: tag.name in ^tags
  end

  defp with_tags(query, _), do: query
end
