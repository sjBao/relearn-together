defmodule RelearnTogether.Cohorts do
  @moduledoc """
  The Cohorts context.
  """

  import Ecto.Query, warn: false
  alias RelearnTogether.Repo
  alias RelearnTogether.LearnAdapter
  alias RelearnTogether.Cohorts.{Campus, Cohort, Mod, Student}

  @doc """
  Returns the list of campuses.

  ## Examples

      iex> list_campuses()
      [%Campus{}, ...]

  """
  def list_campuses do
    Repo.all(Campus)
  end

  @doc """
  Gets a single campus.

  Raises `Ecto.NoResultsError` if the Campus does not exist.

  ## Examples

      iex> get_campus!(123)
      %Campus{}

      iex> get_campus!(456)
      ** (Ecto.NoResultsError)

  """
  def get_campus!(id), do: Repo.get!(Campus, id)

  @doc """
  Creates a campus.

  ## Examples

      iex> create_campus(%{field: value})
      {:ok, %Campus{}}

      iex> create_campus(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_campus(attrs \\ %{}) do
    %Campus{}
    |> Campus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a campus.

  ## Examples

      iex> update_campus(campus, %{field: new_value})
      {:ok, %Campus{}}

      iex> update_campus(campus, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_campus(%Campus{} = campus, attrs) do
    campus
    |> Campus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Campus.

  ## Examples

      iex> delete_campus(campus)
      {:ok, %Campus{}}

      iex> delete_campus(campus)
      {:error, %Ecto.Changeset{}}

  """
  def delete_campus(%Campus{} = campus) do
    Repo.delete(campus)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking campus changes.

  ## Examples

      iex> change_campus(campus)
      %Ecto.Changeset{source: %Campus{}}

  """
  def change_campus(%Campus{} = campus) do
    Campus.changeset(campus, %{})
  end

  @doc """
  Returns the list of cohorts.

  ## Examples

      iex> list_cohorts()
      [%Cohort{}, ...]

  """
  def list_cohorts do
    Cohort
    |> order_by(desc: :start_date, asc: :campus_id)
    |> Repo.all
    |> Repo.preload([:campus, :students])
  end

  def list_sibling_cohorts(cohort_id) do
    %{campus: %{cohorts: cohorts}} = RelearnTogether.Cohorts.get_cohort!(cohort_id) 
    |> RelearnTogether.Repo.preload(campus: [cohorts: :campus])
    cohorts
  end

  @doc """
  Gets a single cohort.

  Raises `Ecto.NoResultsError` if the Cohort does not exist.

  ## Examples

      iex> get_cohort!(123)
      %Cohort{}

      iex> get_cohort!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cohort!(id), do: Cohort |> Repo.get!(id) |> Repo.preload([:campus, :students])

  @doc """
  Creates a cohort.

  ## Examples

      iex> create_cohort(%{field: value})
      {:ok, %Cohort{}}

      iex> create_cohort(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cohort(attrs \\ %{}) do
    campus = Repo.get_by(Campus, [name: attrs["campus"]["name"]])
    %Cohort{}
    |> Cohort.changeset(attrs)
    |> Ecto.Changeset.put_change(:campus, campus)
    |> Repo.insert()
  end

  @doc """
  Updates a cohort.

  ## Examples

      iex> update_cohort(cohort, %{field: new_value})
      {:ok, %Cohort{}}

      iex> update_cohort(cohort, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cohort(%Cohort{} = cohort, attrs) do
    cohort
    |> Cohort.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cohort.

  ## Examples

      iex> delete_cohort(cohort)
      {:ok, %Cohort{}}

      iex> delete_cohort(cohort)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cohort(%Cohort{} = cohort) do
    Repo.delete(cohort)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cohort changes.

  ## Examples

      iex> change_cohort(cohort)
      %Ecto.Changeset{source: %Cohort{}}

  """
  def change_cohort(%Cohort{} = cohort) do
    Cohort.changeset(cohort, %{})
  end

  @doc """
  Returns the list of mods.

  ## Examples

      iex> list_mods()
      [%Mod{}, ...]

  """
  def list_mods do
    Repo.all(Mod)
  end

  @doc """
  Gets a single mod.

  Raises `Ecto.NoResultsError` if the Mod does not exist.

  ## Examples

      iex> get_mod!(123)
      %Mod{}

      iex> get_mod!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mod!(id), do: Repo.get!(Mod, id)

  @doc """
  Creates a mod.

  ## Examples

      iex> create_mod(%{field: value})
      {:ok, %Mod{}}

      iex> create_mod(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mod(attrs \\ %{}) do
    %Mod{}
    |> Mod.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mod.

  ## Examples

      iex> update_mod(mod, %{field: new_value})
      {:ok, %Mod{}}

      iex> update_mod(mod, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mod(%Mod{} = mod, attrs) do
    mod
    |> Mod.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Mod.

  ## Examples

      iex> delete_mod(mod)
      {:ok, %Mod{}}

      iex> delete_mod(mod)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mod(%Mod{} = mod) do
    Repo.delete(mod)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mod changes.

  ## Examples

      iex> change_mod(mod)
      %Ecto.Changeset{source: %Mod{}}

  """
  def change_mod(%Mod{} = mod) do
    Mod.changeset(mod, %{})
  end

  @doc """
  Returns the list of students.

  ## Examples

      iex> list_students()
      [%Student{}, ...]

  """
  def list_students do
    Repo.all(Student)
  end

  @doc """
  Gets a single student.

  Raises `Ecto.NoResultsError` if the Student does not exist.

  ## Examples

      iex> get_student!(123)
      %Student{}

      iex> get_student!(456)
      ** (Ecto.NoResultsError)

  """
  def get_student!(id), do: Repo.get!(Student, id) |> Repo.preload(current_cohort: :campus)

  @doc """
  Creates a student.

  ## Examples

      iex> create_student(%{field: value})
      {:ok, %Student{}}

      iex> create_student(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_student(attrs \\ %{}) do
    current_cohort = get_cohort!(attrs["current_cohort"]["id"])
    %Student{}
    |> Student.changeset(attrs)
    |> Ecto.Changeset.put_change(:current_cohort, current_cohort)
    |> Repo.insert()
  end

  @doc """
  Updates a student.

  ## Examples

      iex> update_student(student, %{field: new_value})
      {:ok, %Student{}}

      iex> update_student(student, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_student(%Student{} = student, attrs) do
    student
    |> Student.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Student.

  ## Examples

      iex> delete_student(student)
      {:ok, %Student{}}

      iex> delete_student(student)
      {:error, %Ecto.Changeset{}}

  """
  def delete_student(%Student{} = student) do
    Repo.delete(student)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking student changes.

  ## Examples

      iex> change_student(student)
      %Ecto.Changeset{source: %Student{}}

  """
  def change_student(%Student{} = student) do
    Student.changeset(student, %{})
  end

  def fetch_batch_students(cohort_id) do
    %Cohort{batch_number: batch_number} = get_cohort!(cohort_id)
    response = LearnAdapter.fetch_batch_students(batch_number)
    case LearnAdapter.handle_response(response) do
      {:ok, %{"users" => users}} ->
        users 
        |> LearnAdapter.filter_invalid_students
        |> Enum.each( fn student ->
            !Repo.get_by(Student, first_name: student["first_name"], github_username: student["github_username"]) &&
            student |> Map.merge(%{"current_cohort" => %{"id" => cohort_id} }) |> create_student
        end)
      {:error, error} -> 
        {:error, error}
    end
  end

  alias RelearnTogether.Cohorts.Label

  @doc """
  Returns the list of labels.

  ## Examples

      iex> list_labels()
      [%Label{}, ...]

  """
  def list_labels do
    Repo.all(Label)
  end

  @doc """
  Gets a single label.

  Raises `Ecto.NoResultsError` if the Label does not exist.

  ## Examples

      iex> get_label!(123)
      %Label{}

      iex> get_label!(456)
      ** (Ecto.NoResultsError)

  """
  def get_label!(id), do: Repo.get!(Label, id)

  @doc """
  Creates a label.

  ## Examples

      iex> create_label(%{field: value})
      {:ok, %Label{}}

      iex> create_label(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_label(attrs \\ %{}) do
    %Label{}
    |> Label.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a label.

  ## Examples

      iex> update_label(label, %{field: new_value})
      {:ok, %Label{}}

      iex> update_label(label, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_label(%Label{} = label, attrs) do
    label
    |> Label.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Label.

  ## Examples

      iex> delete_label(label)
      {:ok, %Label{}}

      iex> delete_label(label)
      {:error, %Ecto.Changeset{}}

  """
  def delete_label(%Label{} = label) do
    Repo.delete(label)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking label changes.

  ## Examples

      iex> change_label(label)
      %Ecto.Changeset{source: %Label{}}

  """
  def change_label(%Label{} = label) do
    Label.changeset(label, %{})
  end

  alias RelearnTogether.Cohorts.Activity

  @doc """
  Returns the list of activities.

  ## Examples

      iex> list_activities()
      [%Activity{}, ...]

  """
  def list_activities do
    Repo.all(Activity)
  end

  @doc """
  Gets a single activity.

  Raises `Ecto.NoResultsError` if the Activity does not exist.

  ## Examples

      iex> get_activity!(123)
      %Activity{}

      iex> get_activity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_activity!(id), do: Repo.get!(Activity, id)

  @doc """
  Creates a activity.

  ## Examples

      iex> create_activity(%{field: value})
      {:ok, %Activity{}}

      iex> create_activity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_activity(attrs \\ %{}) do
    %Activity{}
    |> Activity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a activity.

  ## Examples

      iex> update_activity(activity, %{field: new_value})
      {:ok, %Activity{}}

      iex> update_activity(activity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_activity(%Activity{} = activity, attrs) do
    activity
    |> Activity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Activity.

  ## Examples

      iex> delete_activity(activity)
      {:ok, %Activity{}}

      iex> delete_activity(activity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_activity(%Activity{} = activity) do
    Repo.delete(activity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking activity changes.

  ## Examples

      iex> change_activity(activity)
      %Ecto.Changeset{source: %Activity{}}

  """
  def change_activity(%Activity{} = activity) do
    Activity.changeset(activity, %{})
  end
end
