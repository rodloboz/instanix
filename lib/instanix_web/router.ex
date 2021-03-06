defmodule InstanixWeb.Router do
  use InstanixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :with_session do
    plug InstanixWeb.Helpers.CurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth_layout do
    plug :put_layout, {InstanixWeb.LayoutView, :auth}
  end

  scope "/", InstanixWeb do
    pipe_through [:browser, :with_session]

    get "/", UserController, :index
    get "/accounts/emailsignup/", RegistrationController, :new
    post "/accounts/emailsignup/", RegistrationController, :create
    get "/accounts/login/", SessionController, :new
    post "/accounts/login/", SessionController, :create
    delete "/accounts/logout/", SessionController, :delete

    get "/:username", UserController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", InstanixWeb do
  #   pipe_through :api
  # end
end
