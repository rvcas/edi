# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :edi,
  namespace: EDI,
  ecto_repos: [EDI.Repo]

# Configures the endpoint
config :edi, EDI.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "d7X3dkC7nkVmu/GowDkoTcb6fT0MIBsT8rdRVW0sKfRQ+k+l/La3/y5+xEklKN9E",
  render_errors: [view: EDI.ErrorView, accepts: ~w(json)],
  pubsub: [name: EDI.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Shepherd",
  ttl: { 3, :days },
  verify_issuer: true,
  secret_key: "Rxc4mkiavFFa1omsP+tCSagZ8DtNpM0i9Y8Sq8IWhD8gJwKMBy7tqLfP8ZKqMchH",
  serializer: EDI.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
