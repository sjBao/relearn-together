defmodule RelearnTogether.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :first_name, :string
      add :last_name, :string
      add :preferred_name, :string
      add :github_handle, :string
      add :current_cohort_id, references(:cohorts, on_delete: :nothing)

      timestamps()
    end

  end
end
