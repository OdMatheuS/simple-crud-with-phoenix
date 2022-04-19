defmodule BankConceptWeb.AccountsView do
  use BankConceptWeb, :view
  alias BankConcept.Account

  def render("create.json", %{
        account: %Account{id: id, name: name, email: email, inserted_at: inserted_at},
        token: token
      }) do
    %{
      message: "Account created",
      account: %{
        id: id,
        name: name,
        email: email,
        inserted_at: inserted_at
      },
      token: token
    }
  end

  def render("show.json", %{
        account: %Account{id: id, name: name, email: email, inserted_at: inserted_at}
      }) do
    %{
      id: id,
      name: name,
      email: email,
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{
        account: %Account{
          id: id,
          name: name,
          email: email,
          updated_at: updated_at,
          inserted_at: inserted_at
        }
      }) do
    %{
      message: "Account updated",
      account: %{
        id: id,
        name: name,
        email: email,
        updated_at: updated_at,
        inserted_at: inserted_at
      }
    }
  end
end
