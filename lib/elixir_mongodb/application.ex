defmodule ElixirMongodb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      ElixirMongodbWeb.Endpoint,
       # Connect MongoDB
      { Mongo, [name: :mongo, database: "YOUR_DATABASE", username: "USERNAME", password: "PASSWORD", url: "localhost:27017"] } 
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirMongodb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defimpl Poison.Encoder, for: BSON.ObjectId do
    def encode(id, options) do
      BSON.ObjectId.encode!(id) |> Poison.Encoder.encode(options)
    end
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ElixirMongodbWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
