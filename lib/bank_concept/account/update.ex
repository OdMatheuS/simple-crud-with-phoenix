defmodule BankConcept.Account.Update do
  alias Ecto.UUID
  alias BankConcept.{Repo, Account}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid ID format!"}
      {:ok, _id} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case search_account_by_id(id) do
      nil -> {:error, "Account not found!"}
      account -> update_account(account, params)
    end
  end

  defp search_account_by_id(id), do: Repo.get(Account, id)

  defp update_account(account, params) do
    account
    |> Account.changeset(params)
    |> Repo.update()
  end
end
