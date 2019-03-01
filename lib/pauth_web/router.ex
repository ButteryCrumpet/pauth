defmodule PauthWeb.Router do
  use PauthWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PauthWeb do
    pipe_through :api
    
    post "/token", AuthController, :token
    
  end
end
