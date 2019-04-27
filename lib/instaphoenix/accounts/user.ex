defmodule Instaphoenix.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt

  schema "users" do
    field :about, :string
    field :email, :string
    field :encrypted_password, :string
    field :full_name, :string
    field :username, :string
    field :avatar, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :encrypted_password, :full_name, :about])
    |> validate_required([:username, :email, :encrypted_password, :full_name])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> update_change(:encrypted_password, &Bcrypt.hashpwsalt/1)
    |> validate_format(:username, ~r/\A(?=.*[a-z])[a-z\d]+\Z/i)
  end
end
