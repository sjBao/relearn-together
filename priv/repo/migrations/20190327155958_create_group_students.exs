defmodule RelearnTogether.Repo.Migrations.CreateGroupStudents do
  use Ecto.Migration

  def change do
    create table(:group_students) do
      add :student_id, references(:students, on_delete: :nothing)
      add :group_id, references(:groups, on_delete: :nothing)

      timestamps()
    end

    create index(:group_students, [:student_id])
    create index(:group_students, [:group_id])
  end
end
