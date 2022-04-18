defmodule BankConcept.Account.Get do
  alias Ecto.UUID
  alias BankConcept.{Repo, Account}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, id} -> get(id)
    end
  end

  defp get(id) do
    case Repo.get(Account, id) do
      nil -> {:error, "Account not found!"}
      account -> {:ok, account}
    end
  end
end
