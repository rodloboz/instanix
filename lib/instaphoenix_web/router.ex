defmodule InstaphoenixWeb.Router do
  use InstaphoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth_layout do
    plug :put_layout, {InstaphoenixWeb.LayoutView, :auth}
  end

  scope "/", InstaphoenixWeb do
    pipe_through :browser

    get "/", UserController, :index
    get "/accounts/emailsignup/", RegistrationController, :new
    post "/accounts/emailsignup/", RegistrationController, :create
    get "/accounts/login/", SessionController, :new
    post "/accounts/login/", SessionController, :create
    delete "/accounts/logout/", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", InstaphoenixWeb do
  #   pipe_through :api
  # end
end
