defmodule BankConceptWeb.FallbackController do
  use BankConceptWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(BankConceptWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
