defmodule BankConcept.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  schema "accounts" do
    field :name, :string
    field :password_hash, :string
    field :email, :string
    field :cpf, :string
    field :password, :string, virtual: true
    timestamps()
  end

  @required_params [:name, :password, :email, :cpf]
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 8)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
