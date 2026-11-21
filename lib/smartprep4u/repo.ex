defmodule SmartPrep4U.Repo do
  use Ecto.Repo,
    otp_app: :smartprep4u,
    adapter: Ecto.Adapters.Postgres
end
