defmodule RelearnTogether.Repo do
  use Ecto.Repo,
    otp_app: :relearn_together,
    adapter: Ecto.Adapters.Postgres
end
