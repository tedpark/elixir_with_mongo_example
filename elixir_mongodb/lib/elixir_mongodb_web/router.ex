defmodule ElixirMongodbWeb.Router do
  use ElixirMongodbWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirMongodbWeb do
    pipe_through :api
    resources "/programmings", ProgrammingController, except: [:new, :edit]
  end
end
