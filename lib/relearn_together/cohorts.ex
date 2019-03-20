defmodule RelearnTogether.Cohorts do
  @moduledoc """
  The Cohorts context.
  """

  import Ecto.Query, warn: false
  alias RelearnTogether.Repo

  alias RelearnTogether.Cohorts.Campus

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

  alias RelearnTogether.Cohorts.Cohort

  @doc """
  Returns the list of cohorts.

  ## Examples

      iex> list_cohorts()
      [%Cohort{}, ...]

  """
  def list_cohorts do
    Repo.all(Cohort)
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
  def get_cohort!(id), do: Repo.get!(Cohort, id)

  @doc """
  Creates a cohort.

  ## Examples

      iex> create_cohort(%{field: value})
      {:ok, %Cohort{}}

      iex> create_cohort(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cohort(attrs \\ %{}) do
    %Cohort{}
    |> Cohort.changeset(attrs)
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

  alias RelearnTogether.Cohorts.Mod

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

  alias RelearnTogether.Cohorts.Student

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
  def get_student!(id), do: Repo.get!(Student, id)

  @doc """
  Creates a student.

  ## Examples

      iex> create_student(%{field: value})
      {:ok, %Student{}}

      iex> create_student(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_student(attrs \\ %{}) do
    %Student{}
    |> Student.changeset(attrs)
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
end