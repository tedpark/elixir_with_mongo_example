defmodule ElixirMongodbWeb.ProgrammingControllerTest do
  use ElixirMongodbWeb.ConnCase

  alias ElixirMongodb.Languages
  alias ElixirMongodb.Languages.Programming

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:programming) do
    {:ok, programming} = Languages.create_programming(@create_attrs)
    programming
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all programmings", %{conn: conn} do
      conn = get(conn, Routes.programming_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create programming" do
    test "renders programming when data is valid", %{conn: conn} do
      conn = post(conn, Routes.programming_path(conn, :create), programming: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.programming_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.programming_path(conn, :create), programming: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update programming" do
    setup [:create_programming]

    test "renders programming when data is valid", %{conn: conn, programming: %Programming{id: id} = programming} do
      conn = put(conn, Routes.programming_path(conn, :update, programming), programming: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.programming_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, programming: programming} do
      conn = put(conn, Routes.programming_path(conn, :update, programming), programming: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete programming" do
    setup [:create_programming]

    test "deletes chosen programming", %{conn: conn, programming: programming} do
      conn = delete(conn, Routes.programming_path(conn, :delete, programming))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.programming_path(conn, :show, programming))
      end
    end
  end

  defp create_programming(_) do
    programming = fixture(:programming)
    {:ok, programming: programming}
  end
end
