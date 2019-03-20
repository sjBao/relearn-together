defmodule RelearnTogether.Repo.Migrations.CreateCampuses do
  use Ecto.Migration

  def change do
    create table(:campuses) do
      add :name, :string

      timestamps()
    end

  end
end
