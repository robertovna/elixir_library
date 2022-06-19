defmodule GayaneLibraryWeb.Router do
  use GayaneLibraryWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {GayaneLibraryWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug ProperCase.Plug.SnakeCaseParams
  end

  pipeline :user_auth do
    plug GayaneLibrary.Accounts.Guardian.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
    plug GayaneLibraryWeb.CurrentUserPlug
  end

  scope "/", GayaneLibraryWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", GayaneLibraryWeb.V1 do
    pipe_through [:api]

    post "/users", UserController, :create

    pipe_through [:user_auth, :ensure_auth]

    patch "/users/:id", UserController, :update
    delete "/users/:id", UserController, :delete

    resources "/books", BookController, only: [:index, :show, :create, :update, :delete]
  end
end
