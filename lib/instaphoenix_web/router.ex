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

  scope "/", InstaphoenixWeb do
    pipe_through :browser

    get "/", UserController, :index
    get "accounts/emailsignup/", RegistrationController, :new
    resources "/registrations", RegistrationController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", InstaphoenixWeb do
  #   pipe_through :api
  # end
end
