defmodule Canobie.Router do
  use Canobie.Web, :router

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

  scope "/", Canobie do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/admin", PageController, :admin
    get "/:name", PageController, :user
  end

  scope "/api", Canobie do
    pipe_through :api

    get "/users/:name", UsersController, :show

    get "/users/:name/state", StatesController, :show
    patch "/users/:name/state", StatesController, :update
  end
end
