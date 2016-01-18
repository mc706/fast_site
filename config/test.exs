use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fast_site, FastSite.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :fast_site, FastSite.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "elixir",
  password: "Rowing123!",
  database: "fast_site_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
