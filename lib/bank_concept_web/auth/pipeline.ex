defmodule BankConceptWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :bank_concept

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
