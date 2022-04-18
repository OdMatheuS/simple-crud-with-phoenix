defmodule BankConcept.Account.Create do
  alias BankConcept.{Account, Repo}

  @moduledoc """
  What will happen here:
   will create a public function called Call that receives
   these parameters that the user wants to enter
   and I'm going to I'm going to get these parameters.
   I'll pass them to build() to validate them before completing the operations
  """

  def call(params) do
    params
    |> Account.build()
    |> create_account()
  end

  defp create_account({:ok, struct}), do: Repo.insert(struct)

  defp create_account({:error, _changeset} = error), do: error
end
