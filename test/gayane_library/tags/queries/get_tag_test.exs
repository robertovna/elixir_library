defmodule GayaneLibrary.Tags.Queries.GetTagTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Tags

  test "process/1 get tag by id" do
    tag = insert(:tag)
    assert {:ok, result} = Tags.get_tag(tag.id)
    assert tag.id == result.id
  end
end
