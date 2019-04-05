defmodule RelearnTogether.Groupings.GroupStudent do
  use Ecto.Schema
  import Ecto.Changeset
  
  alias RelearnTogether.Cohorts.Student
  alias RelearnTogether.Groupings.{Activity, Group}

  schema "group_students" do
    belongs_to :student, Student
    belongs_to :group, Group
    belongs_to :activity, Activity


    timestamps()
  end

  @doc false
  def changeset(group_student, attrs) do
    group_student
    |> cast(attrs, [:student_id, :group_id, :activity_id])
    |> validate_required([])
  end
end
