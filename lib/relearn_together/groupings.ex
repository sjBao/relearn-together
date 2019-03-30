defmodule RelearnTogether.Groupings do
  @moduledoc """
  The Groupings context.
  """

  import Ecto.Query, warn: false
  alias RelearnTogether.Repo

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
end
