defmodule RelearnTogether.Groupings.Group do
  use Ecto.Schema
  import Ecto.Changeset
  alias RelearnTogether.Groupings.{Activity, GroupStudent}

  schema "groups" do
    belongs_to :activity, Activity
    has_many :group_students, GroupStudent
    has_many :students, through: [:group_students, :student]
    has_one :label, through: [:activity, :label]

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:activity_id])
    |> change(attrs)
    |> validate_required([])
  end
end
