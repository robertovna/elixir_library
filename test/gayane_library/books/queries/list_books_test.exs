defmodule GayaneLibrary.Books.Queries.ListBooksTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Books

  test "process/1 list_books test" do
    insert_list(10, :book)
    %{entries: result} = Books.list_books()
    assert length(result) == 10
  end

  test "process/1 list_books with search name test" do
    insert_list(5, :book, %{name: "kitchen"})
    insert_list(10, :book, %{name: "cat"})
    attrs = %{name: "cat"}
    %{entries: result} = Books.list_books(attrs)
    assert length(result) == 10
  end

  test "process/1 list_books with search edition test" do
    insert_list(5, :book, %{edition: "Kitchen Studio"})
    insert_list(10, :book, %{edition: "Cat Edition"})
    attrs = %{edition: "edition"}
    %{entries: result} = Books.list_books(attrs)
    assert length(result) == 10
  end

  test "process/1 list_books with search author test" do
    insert_list(10, :book, %{author: "Leo Smith"})
    insert_list(5, :book, %{author: "Sandy Brown"})
    attrs = %{author: "Leo"}
    %{entries: result} = Books.list_books(attrs)
    assert length(result) == 10
  end

  test "process/1 list_books with year greater than test" do
    insert_list(10, :book, %{year: 1814})
    insert_list(5, :book, %{year: 1899})
    attrs = %{year_greater_than: 1851}
    %{entries: result} = Books.list_books(attrs)
    assert length(result) == 5
  end

  test "process/1 list_books with likes greater than test" do
    book = insert(:book)
    insert_list(5, :book_like, %{book: book})

    book2 = insert(:book)
    insert_list(10, :book_like, %{book: book2})

    attrs = %{likes_greater_than: 8}
    %{entries: result} = Books.list_books(attrs)
    assert length(result) == 1
  end

  test "process/1 list_books with tags test" do
    tag = insert(:tag, %{name: "my_tag"})
    tag1 = insert(:tag, %{name: "my_tag2"})
    insert(:book, %{tags: [tag, tag1]})
    insert_list(10, :book, %{tags: [tag]})

    attrs = %{tags: [tag1]}
    %{entries: result} = Books.list_books(attrs)
    assert length(result) == 1
  end
end
