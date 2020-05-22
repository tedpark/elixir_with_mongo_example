defmodule ElixirMongodb.LanguagesTest do
  use ElixirMongodb.DataCase

  alias ElixirMongodb.Languages

  describe "programmings" do
    alias ElixirMongodb.Languages.Programming

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def programming_fixture(attrs \\ %{}) do
      {:ok, programming} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Languages.create_programming()

      programming
    end

    test "list_programmings/0 returns all programmings" do
      programming = programming_fixture()
      assert Languages.list_programmings() == [programming]
    end

    test "get_programming!/1 returns the programming with given id" do
      programming = programming_fixture()
      assert Languages.get_programming!(programming.id) == programming
    end

    test "create_programming/1 with valid data creates a programming" do
      assert {:ok, %Programming{} = programming} = Languages.create_programming(@valid_attrs)
      assert programming.name == "some name"
    end

    test "create_programming/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Languages.create_programming(@invalid_attrs)
    end

    test "update_programming/2 with valid data updates the programming" do
      programming = programming_fixture()
      assert {:ok, %Programming{} = programming} = Languages.update_programming(programming, @update_attrs)
      assert programming.name == "some updated name"
    end

    test "update_programming/2 with invalid data returns error changeset" do
      programming = programming_fixture()
      assert {:error, %Ecto.Changeset{}} = Languages.update_programming(programming, @invalid_attrs)
      assert programming == Languages.get_programming!(programming.id)
    end

    test "delete_programming/1 deletes the programming" do
      programming = programming_fixture()
      assert {:ok, %Programming{}} = Languages.delete_programming(programming)
      assert_raise Ecto.NoResultsError, fn -> Languages.get_programming!(programming.id) end
    end

    test "change_programming/1 returns a programming changeset" do
      programming = programming_fixture()
      assert %Ecto.Changeset{} = Languages.change_programming(programming)
    end
  end
end
