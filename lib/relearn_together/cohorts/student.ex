defmodule RelearnTogether.Cohorts.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :first_name, :string
    field :github_handle, :string
    field :last_name, :string
    field :preferred_name, :string

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:first_name, :last_name, :preferred_name, :github_handle])
    |> validate_required([:first_name, :last_name, :preferred_name, :github_handle])
  end
end
