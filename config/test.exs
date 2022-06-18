import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :gayane_library, GayaneLibrary.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "gayane_library_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gayane_library, GayaneLibraryWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "M8yhm6kyn7tCnE1stdSpqNmi35qnZX0dcZdUfWL7npnSCsEAMSsDvlzaqM3/iH5j",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :gayane_library, GayaneLibrary.Accounts.Services.Guardian,
  secret_key: "SefPyYIoJpfX8NvIAJSPJN5FKQOFPi6cO2hqnUMPbEXg8APXYAiKhxa5va6yuV5O"
