defmodule RelearnTogether.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :activity_id, references(:activities, on_delete: :nothing)

      timestamps()
    end

    create index(:groups, [:activity_id])
  end
end
