defmodule RelearnTogether.Groupings.Activity do
  use Ecto.Schema
  import Ecto.Changeset
  alias RelearnTogether.Cohorts.{Cohort, Mod}
  alias RelearnTogether.Groupings.{Label, Group}

  schema "activities" do
    field :name, :string

    belongs_to :cohort, Cohort
    belongs_to :mod, Mod
    belongs_to :label, Label
    has_many :groups, Group

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:name, :cohort_id, :mod_id, :label_id])
    |> validate_required([])
  end
end
