defmodule FastSite.Router do
  use FastSite.Web, :router

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

  scope "/", FastSite do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/qips", QIPController
    resources "/tickets", TicketController
    resources "/registrations", RegistrationController, only: [:new, :create]
  end


  # Other scopes may use custom stacks.
  # scope "/api", FastSite do
  #   pipe_through :api
  # end
end
