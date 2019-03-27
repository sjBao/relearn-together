defmodule RelearnTogether.Cohorts.Student do
  use Ecto.Schema
  import Ecto.Changeset
  alias RelearnTogether.Cohorts.Cohort

  schema "students" do
    field :first_name, :string
    field :github_username, :string
    field :last_name, :string
    field :preferred_name, :string
    belongs_to :current_cohort, Cohort

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:first_name, :last_name, :preferred_name, :github_username])
    |> validate_required([:first_name, :last_name, :github_username])
  end
end
