defmodule RelearnTogether.Cohorts.Campus do
  use Ecto.Schema
  import Ecto.Changeset
  alias RelearnTogether.Cohorts.Cohort

  schema "campuses" do
    field :name, :string
    has_many :cohorts, Cohort

    timestamps()
  end

  @doc false
  def changeset(campus, attrs) do
    campus
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
