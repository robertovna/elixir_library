defmodule GayaneLibraryWeb.V1.TagController do
  use GayaneLibraryWeb, :controller

  alias GayaneLibrary.Tags
  alias GayaneLibraryWeb.ApplyParams
  alias GayaneLibraryWeb.V1.TagPolicy

  action_fallback(GayaneLibraryWeb.FallbackController)

  defmodule IndexTagListParams do
    use Params.Schema, %{
      page!: :integer,
      page_size!: :integer
    }
  end

  defmodule CreateTagParams do
    use Params.Schema, %{
      name!: :string,
      description!: :string
    }
  end

  def index(conn, params) do
    with {:ok, params} <- ApplyParams.do_apply(IndexTagListParams, params) do
      page = Tags.list_tags(params)
      render(conn, "index.json", %{page: page})
    end
  end

  def show(conn, %{"current_user" => current_user, "id" => id}) do
    with {:ok, tag} <- Tags.get_tag(id),
         :ok <- Bodyguard.permit(TagPolicy, :show, current_user, tag) do
      render(conn, "show.json", %{tag: tag})
    end
  end

  def create(conn, %{"current_user" => current_user} = attrs) do
    with {:ok, attrs} <- ApplyParams.do_apply(CreateTagParams, attrs),
         attrs <- Map.put(attrs, :user_id, current_user.id),
         {:ok, tag} <- Tags.create_tag(attrs) do
      conn
      |> put_status(:created)
      |> render("create.json", %{tag: tag})
    end
  end
end
