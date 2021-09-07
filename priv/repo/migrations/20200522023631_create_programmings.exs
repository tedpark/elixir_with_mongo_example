defmodule ElixirMongodb.Repo.Migrations.CreateProgrammings do
  use Ecto.Migration

  def change do
    create table(:programmings) do
      add :name, :string

      timestamps()
    end

  end
end
