defmodule BankConceptWeb.Auth.Guardian do
  use Guardian, otp_app: :bank_concept
  alias BankConcept.{Account, Repo}

  def subject_for_token(account, _claims) do
    sub = to_string(account.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> BankConcept.get_account()
  end

  def authenticate(%{"id" => account_id, "password" => password}) do
    case Repo.get(Account, account_id) do
      nil -> {:error, "Account not found!"}
      account -> validate_password(account, password)
    end
  end

  defp validate_password(%Account{password_hash: password_hash} = account, password) do
    case Argon2.verify_pass(password, password_hash) do
      true -> create_token(account)
      false -> {:error, :unauthorized}
    end
  end

  defp create_token(account) do
    {:ok, token, _claims} = encode_and_sign(account)
    {:ok, token}
  end
end
