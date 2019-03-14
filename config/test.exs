use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :relearn_together, RelearnTogetherWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :relearn_together, RelearnTogether.Repo,
  username: "postgres",
  password: "postgres",
  database: "relearn_together_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
