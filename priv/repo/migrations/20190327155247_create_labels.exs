defmodule RelearnTogether.Repo.Migrations.CreateLabels do
  use Ecto.Migration

  def change do
    create table(:labels) do
      add :name, :string
      add :priority, :integer

      timestamps()
    end

  end
end
