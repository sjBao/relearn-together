defmodule RelearnTogetherWeb.CohortController do
  use RelearnTogetherWeb, :controller

  alias RelearnTogether.Cohorts
  alias RelearnTogether.Cohorts.Cohort

  def index(conn, _params) do
    cohorts = Cohorts.list_cohorts()
    render(conn, "index.html", cohorts: cohorts)
  end

  def new(conn, _params) do
    conn
    |> assign(:campuses, Cohorts.list_campuses)
    |> assign(:campus, Cohorts.change_campus(%Cohorts.Campus{}))
    |> assign(:changeset, Cohorts.change_cohort(%Cohort{}))
    |> render("new.html")
  end

  def create(conn, %{"cohort" => cohort_params}) do
    case Cohorts.create_cohort(cohort_params) do
      {:ok, cohort} ->
        conn
        |> put_flash(:info, "Cohort created successfully.")
        |> redirect(to: Routes.cohort_path(conn, :show, cohort))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cohort = Cohorts.get_cohort!(id)
    render(conn, "show.html", cohort: cohort)
  end

  def edit(conn, %{"id" => id}) do
    cohort = Cohorts.get_cohort!(id)
    conn
    |> assign(:cohort, cohort)
    |> assign(:campuses, Cohorts.list_campuses)
    |> assign(:changeset, Cohorts.change_cohort(cohort))
    |> render "edit.html"
  end

  def update(conn, %{"id" => id, "cohort" => cohort_params}) do
    cohort = Cohorts.get_cohort!(id)

    case Cohorts.update_cohort(cohort, cohort_params) do
      {:ok, cohort} ->
        conn
        |> put_flash(:info, "Cohort updated successfully.")
        |> redirect(to: Routes.cohort_path(conn, :show, cohort))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cohort: cohort, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cohort = Cohorts.get_cohort!(id)
    {:ok, _cohort} = Cohorts.delete_cohort(cohort)

    conn
    |> put_flash(:info, "Cohort deleted successfully.")
    |> redirect(to: Routes.cohort_path(conn, :index))
  end
end
