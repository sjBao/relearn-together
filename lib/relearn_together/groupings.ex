defmodule RelearnTogether.Groupings do
  @moduledoc """
  The Groupings context.
  """

  import Ecto.Query, warn: false
  alias RelearnTogether.Repo
  alias RelearnTogether.Cohorts.{Student, Cohort}
  alias RelearnTogether.Groupings.{Label, Group, GroupStudent, Activity}

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
  def get_activity(id), do: Repo.get(Activity, id)

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

  @doc """
  Returns the list of groups.

  ## Examples

      iex> list_groups()
      [%Group{}, ...]

  """
  def list_groups do
    Repo.all(Group)
  end

  @doc """
  Gets a single group.

  Raises `Ecto.NoResultsError` if the Group does not exist.

  ## Examples

      iex> get_group!(123)
      %Group{}

      iex> get_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_group!(id), do: Repo.get!(Group, id)

  @doc """
  Creates a group.

  ## Examples

      iex> create_group(%{field: value})
      {:ok, %Group{}}

      iex> create_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_group(attrs \\ %{}) do
    %Group{}
    |> Group.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a group.

  ## Examples

      iex> update_group(group, %{field: new_value})
      {:ok, %Group{}}

      iex> update_group(group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_group(%Group{} = group, attrs) do
    group
    |> Group.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Group.

  ## Examples

      iex> delete_group(group)
      {:ok, %Group{}}

      iex> delete_group(group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_group(%Group{} = group) do
    Repo.delete(group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking group changes.

  ## Examples

      iex> change_group(group)
      %Ecto.Changeset{source: %Group{}}

  """
  def change_group(%Group{} = group) do
    Group.changeset(group, %{})
  end

  @doc """
  Returns the list of group_students.

  ## Examples

      iex> list_group_students()
      [%GroupStudent{}, ...]

  """
  def list_group_students do
    Repo.all(GroupStudent)
  end

  @doc """
  Gets a single group_student.

  Raises `Ecto.NoResultsError` if the Group student does not exist.

  ## Examples

      iex> get_group_student!(123)
      %GroupStudent{}

      iex> get_group_student!(456)
      ** (Ecto.NoResultsError)

  """
  def get_group_student!(id), do: Repo.get!(GroupStudent, id)

  @doc """
  Creates a group_student.

  ## Examples

      iex> create_group_student(%{field: value})
      {:ok, %GroupStudent{}}

      iex> create_group_student(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_group_student(attrs \\ %{}) do
    %GroupStudent{}
    |> GroupStudent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a group_student.

  ## Examples

      iex> update_group_student(group_student, %{field: new_value})
      {:ok, %GroupStudent{}}

      iex> update_group_student(group_student, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_group_student(%GroupStudent{} = group_student, attrs) do
    group_student
    |> GroupStudent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a GroupStudent.

  ## Examples

      iex> delete_group_student(group_student)
      {:ok, %GroupStudent{}}

      iex> delete_group_student(group_student)
      {:error, %Ecto.Changeset{}}

  """
  def delete_group_student(%GroupStudent{} = group_student) do
    Repo.delete(group_student)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking group_student changes.

  ## Examples

      iex> change_group_student(group_student)
      %Ecto.Changeset{source: %GroupStudent{}}

  """
  def change_group_student(%GroupStudent{} = group_student) do
    GroupStudent.changeset(group_student, %{})
  end

  def ungrouped_students(activity_id, cohort_id) do
    grouped_students = from s in Student,
                        join: c in Cohort,
                        join: a in Activity,
                        join: gs in GroupStudent,
                        on: s.current_cohort_id == c.id 
                            and a.cohort_id == c.id 
                            and gs.activity_id == a.id 
                            and gs.student_id == s.id,
                        where: a.id == ^activity_id,

                        select: s
    all_students = from s in Student,
                   where: s.current_cohort_id == ^cohort_id

    Repo.all(all_students) -- Repo.all(grouped_students)
  end

  def is_student_grouped?(%{"activity_id" => activity_id, "student_id" => student_id}) do
    query = from gs in GroupStudent, 
            where: gs.activity_id == ^activity_id and gs.student_id == ^student_id,
            select: gs
    Repo.one(query)
  end

  def create_or_update_group_student(nil, attrs) do
    create_group_student(attrs)
  end

  def create_or_update_group_student(group_student, attrs) do
    update_group_student(group_student, attrs)
  end

  def list_previous_activity_groups_for_cohort(cohort_id, activity_id) do
    query = from a in Activity,
            where: a.cohort_id == ^cohort_id and a.id != ^activity_id,
            join: g in Group, on: g.activity_id == a.id,
            select: g
    Repo.all(query) |> Repo.preload([:students, :label])
  end

  def group_overlaps?(group1, group2) do
    Enum.count(group1.students) > 1 
    && Enum.count(group2.students) > 1
    && Enum.count(group1.students -- group2.students) 
    == Enum.count(group1.students) - Enum.count(group2.students)
  end

  def frequency_of_current_group(current_group, previous_groups) do
    previous_groups
    |> Enum.reduce(%{}, fn (group, group_frequencies) ->
      cond do
        group_overlaps?(group, current_group) ->
          group_frequencies |> Map.update(group.label.name, 1, &(&1 + 1)) |> IO.inspect
        true ->
          group_frequencies
      end
    end)
  end

  def get_group_frequencies_for_activity(activity_id) do
    %{groups: groups, cohort_id: cohort_id} = get_activity(activity_id) |> Repo.preload([groups: :students])
    previous_groups = list_previous_activity_groups_for_cohort(cohort_id, activity_id)

    groups
    |> Enum.reduce(%{}, fn (group, activity_groups_frequencies) -> 
      Map.put(activity_groups_frequencies, group.id, frequency_of_current_group(group, previous_groups))
    end)

  end

  # we need a function that tells me how many times a pair of students has been paired off before by activity type
  # get all pairs for this activity
  # iterate through pairs. for each iteration, 
    # if they are pairs, iterate through all groups in cohort
      # if both numbers are found in the group, add a counter to group type in a struct
  # we also need a function that builds a map of pairing frequency between every other student 
end
