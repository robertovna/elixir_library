defmodule GayaneLibrary.Tags.Queries.ListTagsTest do
  use GayaneLibrary.DataCase

  alias GayaneLibrary.Tags

  test "process/1 list_tags test" do
    insert_list(10, :tag)
    %{entries: result} = Tags.list_tags()
    assert length(result) == 10
  end
end
