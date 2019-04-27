defmodule InstanixWeb.PageController do
  use InstanixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
