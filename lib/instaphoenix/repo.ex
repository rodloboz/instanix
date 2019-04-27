defmodule Instaphoenix.Repo do
  use Ecto.Repo,
    otp_app: :instaphoenix,
    adapter: Ecto.Adapters.Postgres
end
