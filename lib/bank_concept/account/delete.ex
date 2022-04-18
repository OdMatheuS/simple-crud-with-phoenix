defmodule BankConcept.Account.Delete do
  alias Ecto.UUID
  alias BankConcept.{Repo, Account}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, id} -> delete(id)
    end
  end

  defp delete(id) do
    case search_account_by_id(id) do
      nil -> {:error, "Account not found!"}
      account -> Repo.delete(account)
    end
  end

  defp search_account_by_id(id), do: Repo.get(Account, id)
end
