defmodule BankConceptWeb.AccountsController do
  use BankConceptWeb, :controller
  alias BankConceptWeb.Auth.Guardian

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

  def show(conn, %{"id" => id}) do
    id
    |> BankConcept.get_account()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> BankConcept.update_account()
    |> handle_response(conn, "update.json", :ok)
  end

  def create(conn, params) do
    with {:ok, account} <- BankConcept.create_account(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(account) do
      conn
      |> put_status(:created)
      |> render("create.json", %{account: account, token: token})
    end
  end

  defp handle_response({:ok, account}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, account: account)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
