defmodule GayaneLibrary.Books.Commands.UpdateBookTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Books

  test "process/1 update_book test" do
    book = insert(:book, %{name: "some"})
    attrs = %{name: "updated_name"}
    assert {:ok, updated_book} = Books.update_book(book, attrs)
    assert updated_book.name == attrs.name
    assert updated_book.id == book.id
    assert updated_book.text_content == book.text_content
    assert updated_book.year == book.year
    assert updated_book.user_id == book.user_id
    assert updated_book.author == book.author
    assert updated_book.edition == book.edition
  end
end
