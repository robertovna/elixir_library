defmodule GayaneLibrary.Repo do
  use Ecto.Repo,
    otp_app: :gayane_library,
    adapter: Ecto.Adapters.Postgres
end
