defmodule Pauth.Auth.User do
  @moduledoc """
    Ecto User entity module
  """
  use Ecto.Schema
  import Ecto.Changeset
  
  @timestamps_opts [usec: false]
  @primary_key {:id, :binary_id, autogenerate: true}
  
  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> put_password_hash()
  end
  
  defp put_password_hash(
      %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
    ) do
    change(changeset, password_hash: Bcrypt.hash_pwd_salt(password))  
  end
  
  defp put_password_hash(changeset) do
    changeset
  end
  
end
