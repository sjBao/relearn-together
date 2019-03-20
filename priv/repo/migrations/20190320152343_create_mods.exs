defmodule RelearnTogether.Repo.Migrations.CreateMods do
  use Ecto.Migration

  def change do
    create table(:mods) do
      add :number, :integer

      timestamps()
    end

  end
end
