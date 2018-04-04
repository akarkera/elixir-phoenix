# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dubber,
  ecto_repos: [Dubber.Repo],
  client_id: System.get_env("CLIENT_ID"),
  client_secret: System.get_env("CLIENT_SECRET"),
  username: System.get_env("USERNAME"),
  password: System.get_env("PASSWORD"),
  url: System.get_env("URL")

# Configures the endpoint
config :dubber, Dubber.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yLvD3Z444uPHmG5bosNmlz2SAc212nsXmo7zWGme3HiHkgburBgz6WHM/84uFFC+",
  render_errors: [view: Dubber.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Dubber.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
