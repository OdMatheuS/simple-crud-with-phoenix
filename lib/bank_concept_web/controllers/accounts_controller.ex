defmodule BankConceptWeb.AccountsController do
  use BankConceptWeb, :controller

  action_fallback BankConceptWeb.FallbackController

  def delete(conn, %{"id" => id}) do
    id
    |> BankConcept.delete_account()
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, _accounnt}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

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
