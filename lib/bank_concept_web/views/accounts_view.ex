defmodule BankConceptWeb.AccountsView do
  use BankConceptWeb, :view
  alias BankConcept.Account

  def render("create.json", %{
        account: %Account{id: id, name: name, email: email, inserted_at: inserted_at}
      }) do
    %{
      message: "Account created",
      account: %{
        id: id,
        name: name,
        email: email,
        inserted_at: inserted_at
      }
    }
  end
end
