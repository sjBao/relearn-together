defmodule RelearnTogether.Cohorts.Cohort do
  use Ecto.Schema
  import Ecto.Changeset
  alias RelearnTogether.Cohorts.Campus

  schema "cohorts" do
    field :batch_number, :integer
    field :start_date, :date
    belongs_to :campus, Campus

    timestamps()
  end

  @doc false
  def changeset(cohort, attrs) do
    cohort
    |> cast(attrs, [:start_date, :batch_number])
    |> validate_required([:start_date, :batch_number])
  end
end
