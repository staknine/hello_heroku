# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello_heroku,
  ecto_repos: [HelloHeroku.Repo]

# Configures the endpoint
config :hello_heroku, HelloHerokuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uub2IXQQP6PAHM42w4ZlfrRBaRYxjO7GWbVWBkahfuPrQcRhJXxMN8aeIGKerbj8",
  render_errors: [view: HelloHerokuWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HelloHeroku.PubSub,
  live_view: [signing_salt: "Q4jWW9sj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
