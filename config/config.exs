# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :openfn_ix, OpenfnIx.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "SIZHsIPGfUEpzckJvRC+zzsTto4WrxrwtPdgeCwtMYU/tuDLZ0LhEKDsSair9Z8g",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: OpenfnIx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Configure phoenix_token_auth
config :phoenix_token_auth,
  user_model: OpenfnIx.User,                                                              # ecto model used for authentication
  repo: OpenfnIx.Repo,                                                                    # ecto repo
  crypto_provider: Comeonin.Bcrypt,                                                    # crypto provider for hashing passwords/tokens. see http://hexdocs.pm/comeonin/
  token_validity_in_minutes: 7 * 24 * 60,                                              # minutes from login until a token expires
  email_sender: "myapp@example.com",                                                   # sender address of emails sent by the app
  emailing_module: PhoenixTokenAuth.Mailer,                                             # module implementing the `PhoenixTokenAuth.MailingBehaviour` for generating emails
  mailgun_domain: "openfn-ix.herokuapp.com",                                                    # domain of your mailgun account
  mailgun_key: "key-95d319da9dea2775a1f98a3d4a678605"                                                               # secret key of your mailgun account
  # user_model_validator: {OpenfnIx.User, :user_validator} 

  # Configure joken
  config :joken,
  json_module: PhoenixTokenAuth.PoisonHelper,
  algorithm: :HS256 # Optional. defaults to :HS256
