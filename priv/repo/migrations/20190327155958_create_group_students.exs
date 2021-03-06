defmodule RelearnTogether.Repo.Migrations.CreateGroupStudents do
  use Ecto.Migration

  def change do
    create table(:group_students) do
      add :activity_id, references(:activities, on_delete: :delete_all)
      add :student_id, references(:students, on_delete: :delete_all)
      add :group_id, references(:groups, on_delete: :delete_all)

      timestamps()
    end

    create index(:group_students, [:student_id])
    create index(:group_students, [:group_id])
    create index(:group_students, [:activity_id])
  end
end
