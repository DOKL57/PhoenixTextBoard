defmodule Phoenixblog.Repo do
  use Ecto.Repo,
    otp_app: :phoenixblog,
    adapter: Ecto.Adapters.Postgres
end
