defmodule ElixirMongodbWeb.ProgrammingController do
  use ElixirMongodbWeb, :controller

  alias ElixirMongodb.Languages
  alias ElixirMongodb.Languages.Programming

  action_fallback ElixirMongodbWeb.FallbackController

  def index(conn, _params) do
    cursor = Mongo.find_one(:mongo, "devs", %{})
    
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(cursor))
    
    # programmings = Languages.list_programmings()
    # render(conn, "index.json", programmings: programmings)
  end

  def create(conn, %{"programming" => programming_params}) do
    with {:ok, %Programming{} = programming} <- Languages.create_programming(programming_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.programming_path(conn, :show, programming))
      |> render("show.json", programming: programming)
    end
  end

  def show(conn, %{"id" => id}) do
    programming = Languages.get_programming!(id)
    render(conn, "show.json", programming: programming)
  end

  def update(conn, %{"id" => id, "programming" => programming_params}) do
    programming = Languages.get_programming!(id)

    with {:ok, %Programming{} = programming} <- Languages.update_programming(programming, programming_params) do
      render(conn, "show.json", programming: programming)
    end
  end

  def delete(conn, %{"id" => id}) do
    programming = Languages.get_programming!(id)

    with {:ok, %Programming{}} <- Languages.delete_programming(programming) do
      send_resp(conn, :no_content, "")
    end
  end
end
