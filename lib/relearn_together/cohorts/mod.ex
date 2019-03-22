defmodule RelearnTogether.Cohorts.Mod do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mods" do
    field :number, :integer

    timestamps()
  end

  @doc false
  def changeset(mod, attrs) do
    mod
    |> cast(attrs, [:number])
    |> validate_required([:number])
  end
end
