defmodule Instaphoenix.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :about, :string
    field :email, :string
    field :encrypted_password, :string
    field :full_name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :encrypted_password, :full_name, :about])
    |> validate_required([:username, :email, :encrypted_password, :full_name, :about])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
