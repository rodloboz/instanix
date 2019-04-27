defmodule InstaphoenixWeb.PageController do
  use InstaphoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
