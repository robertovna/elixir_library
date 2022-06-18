# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :gayane_library,
  ecto_repos: [GayaneLibrary.Repo]

# Configures the endpoint
config :gayane_library, GayaneLibraryWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: GayaneLibraryWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GayaneLibrary.PubSub,
  live_view: [signing_salt: "XuOqEAoP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :gayane_library, GayaneLibrary.Accounts.Services.Guardian, issuer: "gayane_library"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
