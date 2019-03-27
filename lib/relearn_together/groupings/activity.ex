defmodule RelearnTogether.Groupings.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field :cohort_id, :id
    field :mod_id, :id
    field :label_id, :id

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [])
    |> validate_required([])
  end
end
