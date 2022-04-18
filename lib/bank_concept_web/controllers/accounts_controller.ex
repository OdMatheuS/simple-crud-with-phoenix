defmodule BankConceptWeb.AccountsController do
  use BankConceptWeb, :controller

  action_fallback BankConceptWeb.FallbackController

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

  defp handle_response({:error, _changeset} = error, _conn), do: error
end
