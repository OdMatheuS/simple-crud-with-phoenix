defmodule BankConceptWeb.AccountsController do
  use BankConceptWeb, :controller

  def create(conn, params) do
    params
    |> BankConcept.create_account()
    |> handle_response(conn)
  end

  defp handle_response({:ok, account}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", account: account)
  end
end
