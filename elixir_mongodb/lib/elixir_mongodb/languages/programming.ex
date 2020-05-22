defmodule ElixirMongodb.Languages.Programming do
  use Ecto.Schema
  import Ecto.Changeset

  schema "programmings" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(programming, attrs) do
    programming
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
