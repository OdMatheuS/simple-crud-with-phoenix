defmodule BankConcept do
  @moduledoc """
  My facade:

  every time I call my 'create_account',
  I will delegate to the Create module, and there it will call fn 'call
  """
  alias BankConcept.Account

  defdelegate create_account(params), to: Account.Create, as: :call
  defdelegate delete_account(params), to: Account.Delete, as: :call
  defdelegate get_account(params), to: Account.Get, as: :call
end
