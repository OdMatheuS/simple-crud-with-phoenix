defmodule BankConceptWeb.Auth.Guardian do
  use Guardian, otp_app: :bank_concept

  def subject_for_token(account, _claims) do
    sub = to_string(account.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> BankConcept.get_account()
  end
end
