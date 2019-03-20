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
end
