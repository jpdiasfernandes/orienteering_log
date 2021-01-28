# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :orienteering_log,
  ecto_repos: [OrienteeringLog.Repo]

# Configures the endpoint
config :orienteering_log, OrienteeringLogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OQ7xF3qHXmp/UBghhMje2uKEGsgp6uXhoV11zKjbDMQkGfwIs/gaDLv5b6IGk0Jw",
  render_errors: [view: OrienteeringLogWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: OrienteeringLog.PubSub,
  live_view: [signing_salt: "qcL8hNWy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
