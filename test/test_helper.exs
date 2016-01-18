ExUnit.start

Mix.Task.run "ecto.create", ~w(-r FastSite.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r FastSite.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(FastSite.Repo)

