defmodule HelloHeroku.Repo do
  use Ecto.Repo,
    otp_app: :hello_heroku,
    adapter: Ecto.Adapters.Postgres
end
