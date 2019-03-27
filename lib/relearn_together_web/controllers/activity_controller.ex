defmodule RelearnTogetherWeb.ActivityController do
  use RelearnTogetherWeb, :controller

  alias RelearnTogether.Cohorts
  alias RelearnTogether.Groupings
  alias RelearnTogether.Groupings.Activity

  def index(conn, _params) do
    activities = Groupings.list_activities()
    render(conn, "index.html", activities: activities)
  end

  def new(conn, _params) do
    changeset = Groupings.change_activity(%Activity{})
    conn
    |> assign(:labels, Groupings.list_labels)
    |> assign(:mods, Cohorts.list_mods)
    |> render("new.html", changeset: changeset)
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
    activity = Groupings.get_activity!(id)
    render(conn, "show.html", activity: activity)
  end

  def edit(conn, %{"id" => id}) do
    activity = Groupings.get_activity!(id)
    changeset = Groupings.change_activity(activity)
    render(conn, "edit.html", activity: activity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "activity" => activity_params}) do
    activity = Groupings.get_activity!(id)

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
    activity = Groupings.get_activity!(id)
    {:ok, _activity} = Groupings.delete_activity(activity)

    conn
    |> put_flash(:info, "Activity deleted successfully.")
    |> redirect(to: Routes.activity_path(conn, :index))
  end
end
