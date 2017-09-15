defmodule ChaboRest.Router do
  use ChaboRest.Web, :router

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

  scope "/", ChaboRest do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", ChaboRest do
    pipe_through  :api

    get "/tweets", API.V1.TweetController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChaboRest do
  #   pipe_through :api
  # end
end
