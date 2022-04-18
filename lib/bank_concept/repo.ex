defmodule BankConcept.Repo do
  use Ecto.Repo,
    otp_app: :bank_concept,
    adapter: Ecto.Adapters.Postgres
end
