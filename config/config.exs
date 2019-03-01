# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pauth,
  ecto_repos: [Pauth.Repo]

# Configures the endpoint
config :pauth, PauthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2H3aPIXhBXcaH5/q0nK7gcX+llwK+BhVrcIfd0YEknKv/l1idx6n64WLw+L+jyk0",
  render_errors: [view: PauthWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Pauth.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Guardian config
config :pauth, Pauth.Auth.Token,
  issuer: "pauth",
  secret_key: "tPwZVGpqvaf9U3MjroD+TOmjkXb6lUQgiOmbz8vBPigZXisRpizFPrlAyFowGFj4"
