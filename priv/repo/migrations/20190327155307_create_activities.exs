defmodule RelearnTogether.Repo.Migrations.CreateActivities do
  use Ecto.Migration

  def change do
    create table(:activities) do
      add :cohort_id, references(:cohorts, on_delete: :nothing)
      add :mod_id, references(:mods, on_delete: :nothing)
      add :label_id, references(:labels, on_delete: :nothing)

      timestamps()
    end

    create index(:activities, [:cohort_id])
    create index(:activities, [:mod_id])
    create index(:activities, [:label_id])
  end
end
