defmodule RelearnTogether.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :first_name, :string
      add :last_name, :string
      add :preferred_name, :string
      add :github_handle, :string

      timestamps()
    end

  end
end
