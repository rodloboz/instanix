defmodule InstaphoenixWeb.SessionController do
  use InstaphoenixWeb, :controller

  alias Instaphoenix.Accounts
  alias Instaphoenix.Accounts.User

  plug :put_layout, "auth.html"

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"session" => auth_params}) do
    user = Accounts.get_by_email_or_username(auth_params["login"])

    case Comeonin.Bcrypt.check_pass(user, auth_params["password"]) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Logged in successfully.")
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, _} ->
        conn
        |> put_flash(:error, "Something went wrong, we could not log you in.")
        render(conn, "new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Signed out successfully.")
    |> redirect(to: Routes.user_path(conn, :index))
  end
end
