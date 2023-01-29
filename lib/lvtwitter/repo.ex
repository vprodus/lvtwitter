defmodule Lvtwitter.Repo do
  use Ecto.Repo,
    otp_app: :lvtwitter,
    adapter: Ecto.Adapters.Postgres
end
