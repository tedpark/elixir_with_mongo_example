defmodule ElixirMongodb.Languages do
  @moduledoc """
  The Languages context.
  """

  import Ecto.Query, warn: false
  alias ElixirMongodb.Repo

  alias ElixirMongodb.Languages.Programming

  @doc """
  Returns the list of programmings.

  ## Examples

      iex> list_programmings()
      [%Programming{}, ...]

  """
  def list_programmings do
    Repo.all(Programming)
  end

  @doc """
  Gets a single programming.

  Raises `Ecto.NoResultsError` if the Programming does not exist.

  ## Examples

      iex> get_programming!(123)
      %Programming{}

      iex> get_programming!(456)
      ** (Ecto.NoResultsError)

  """
  def get_programming!(id), do: Repo.get!(Programming, id)

  @doc """
  Creates a programming.

  ## Examples

      iex> create_programming(%{field: value})
      {:ok, %Programming{}}

      iex> create_programming(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_programming(attrs \\ %{}) do
    %Programming{}
    |> Programming.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a programming.

  ## Examples

      iex> update_programming(programming, %{field: new_value})
      {:ok, %Programming{}}

      iex> update_programming(programming, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_programming(%Programming{} = programming, attrs) do
    programming
    |> Programming.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a programming.

  ## Examples

      iex> delete_programming(programming)
      {:ok, %Programming{}}

      iex> delete_programming(programming)
      {:error, %Ecto.Changeset{}}

  """
  def delete_programming(%Programming{} = programming) do
    Repo.delete(programming)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking programming changes.

  ## Examples

      iex> change_programming(programming)
      %Ecto.Changeset{source: %Programming{}}

  """
  def change_programming(%Programming{} = programming) do
    Programming.changeset(programming, %{})
  end
end
