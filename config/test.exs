use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :openfn_ix, OpenfnIx.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :openfn_ix, OpenfnIx.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "openfn_ix_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure phoenix_token_auth
config :phoenix_token_auth,
  mailgun_mode: :test,
  mailgun_test_file_path: "/tmp/openfnix_mail"
