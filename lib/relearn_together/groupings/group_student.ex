defmodule RelearnTogether.Groupings.GroupStudent do
  use Ecto.Schema
  import Ecto.Changeset

  alias RelearnTogether.Groupings.{Activity}

  schema "group_students" do
    field :student_id, :id
    field :group_id, :id
    belongs_to :activity, Activity


    timestamps()
  end

  @doc false
  def changeset(group_student, attrs) do
    group_student
    |> cast(attrs, [:student_id, :group_id])
    |> validate_required([])
  end
end
