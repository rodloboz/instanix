defmodule Instanix.Repo do
  use Ecto.Repo,
    otp_app: :instanix,
    adapter: Ecto.Adapters.Postgres
end
