defmodule RelearnTogether.Groupings.GroupStudent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "group_students" do
    field :student_id, :id
    field :group_id, :id

    timestamps()
  end

  @doc false
  def changeset(group_student, attrs) do
    group_student
    |> cast(attrs, [])
    |> validate_required([])
  end
end
