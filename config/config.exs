# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :chabo_rest, ChaboRest.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "chabo_rest_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"


config :extwitter, :oauth, [
  consumer_key: System.get_env("TWITTER_CONSUMER_KEY") || "",
  consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET") || "",
  access_token: System.get_env("TWITTER_ACCESS_TOKEN") || "",
  access_token_secret: System.get_env("TWITTER_ACCESS_TOKEN_SECRET") || ""
]

# General application configuration
config :chabo_rest,
  ecto_repos: [ChaboRest.Repo]

# Configures the endpoint
config :chabo_rest, ChaboRest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5oHODa2UBZDRVUG92BJnqXljbcV45JFx6AfJIEFuw6Kn46Kb/EQctL68U3Hr0fdO",
  render_errors: [view: ChaboRest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ChaboRest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
