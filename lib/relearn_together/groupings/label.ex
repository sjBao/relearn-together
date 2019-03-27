defmodule RelearnTogether.Groupings.Label do
  use Ecto.Schema
  import Ecto.Changeset

  schema "labels" do
    field :name, :string
    field :priority, :integer

    timestamps()
  end

  @doc false
  def changeset(label, attrs) do
    label
    |> cast(attrs, [:name, :priority])
    |> validate_required([:name, :priority])
  end
end
