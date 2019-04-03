defmodule RelearnTogetherWeb.ActivityController do
  use RelearnTogetherWeb, :controller

  alias RelearnTogether.Repo
  alias RelearnTogether.Cohorts
  alias RelearnTogether.Groupings
  alias RelearnTogether.Groupings.Activity

  def index(conn, _params) do
    activities = Groupings.list_activities()
    render(conn, "index.html", activities: activities)
  end

  def new(conn, %{"cohort_id" => cohort_id}) do
    case Groupings.create_activity(%{cohort_id: cohort_id}) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity created successfully.")
        |> redirect(to: Routes.cohort_activity_path(conn, :edit, cohort_id, activity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def create(conn, %{"activity" => activity_params}) do
    case Groupings.create_activity(activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity created successfully.")
        |> redirect(to: Routes.activity_path(conn, :show, activity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    activity = Groupings.get_activity(id)
    render(conn, "show.html", activity: activity)
  end

  def edit(conn, %{"cohort_id" => cohort_id, "id" => id}) do
    activity = Groupings.get_activity(id) |> Repo.preload(:groups)
    changeset = Groupings.change_activity(activity)
    %{students: students} = Cohorts.get_cohort!(cohort_id) |> Repo.preload(:students)
    conn
    |> assign(:labels, Groupings.list_labels)
    |> assign(:mods, Cohorts.list_mods)
    |> assign(:students, students)
    |> assign(:activity, activity)
    |> render("edit.html", activity: activity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "activity" => activity_params}) do
    activity = Groupings.get_activity(id)

    case Groupings.update_activity(activity, activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity updated successfully.")
        |> redirect(to: Routes.activity_path(conn, :show, activity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", activity: activity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    activity = Groupings.get_activity(id)
    {:ok, _activity} = Groupings.delete_activity(activity)

    conn
    |> put_flash(:info, "Activity deleted successfully.")
    |> redirect(to: Routes.activity_path(conn, :index))
  end
end
