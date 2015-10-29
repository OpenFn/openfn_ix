defmodule OpenfnIx.Router do
  use Phoenix.Router
  require PhoenixTokenAuth

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

  pipeline :authenticated do
    plug PhoenixTokenAuth.Plug
  end

  scope "/", OpenfnIx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
  end

  scope "/api" do
    pipe_through :api

    post  "users",                 PhoenixTokenAuth.Controllers.Users, :create
    post  "users/:id/confirm",     PhoenixTokenAuth.Controllers.Users, :confirm
    post  "sessions",              PhoenixTokenAuth.Controllers.Sessions, :create
    delete  "sessions",            PhoenixTokenAuth.Controllers.Sessions, :delete
    post  "password_resets",       PhoenixTokenAuth.Controllers.PasswordResets, :create
    post  "password_resets/reset", PhoenixTokenAuth.Controllers.PasswordResets, :reset
    get   "account",               PhoenixTokenAuth.Controllers.Account, :show
    put   "account",               PhoenixTokenAuth.Controllers.Account, :update
  end

  scope "/api" do
    pipe_through :authenticated
    pipe_through :api

    resources "/messages", MessagesController
  end

  # Other scopes may use custom stacks.
  # scope "/api", OpenfnIx do
  #   pipe_through :api
  # end
end
