# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :instanix,
  ecto_repos: [Instanix.Repo]

# Configures the endpoint
config :instanix, InstanixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aXlxs9wCAPbnBAEn0SXKYp+6GjkvaS0SAK9RZnVs2gg8jKDxsaxeRim5Os1pzi0S",
  render_errors: [view: InstanixWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Instanix.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
