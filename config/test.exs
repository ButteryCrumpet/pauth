use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pauth, PauthWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pauth, Pauth.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "ppdbroot",
  password: "Ty7dB2GJ69h9",
  database: "test_pauth",
  hostname: "ppdev-db.cjxsalhriwwe.ap-northeast-1.rds.amazonaws.com",
  pool: Ecto.Adapters.SQL.Sandbox
