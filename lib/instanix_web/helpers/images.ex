defmodule InstanixWeb.Helpers.Images do
  alias InstanixWeb.Router.Helpers, as: Routes

  def avatar_url(conn, user) do
    cond do
      avatar = user.avatar ->
        avatar
      gravatar?(user) ->
        user.email
        |> hash_email
        |> gravatar_url
      true ->
        Routes.static_path(conn, "/images/default_avatar.png")
    end
  end

  defp gravatar?(user) do
    user.email
    |> hash_email
    |> gravatar_check
    |> HTTPoison.get!
    |> Map.get(:status_code) != 404
  end

  defp hash_email(email) do
    Base.encode16(:erlang.md5(email), case: :lower)
  end

  defp gravatar_check(hash) do
    "http://gravatar.com/avatar/#{hash}.png?d=404"
  end

  defp gravatar_url(hash) do
    "http://gravatar.com/avatar/#{hash}.png?s=200"
  end
end
