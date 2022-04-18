defmodule BankConcept.Repo.Migrations.CreateTableAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :email, :string
      add :cpf, :string
      add :password_hash, :string
      timestamps()
    end
  end
end
