defmodule RelearnTogetherWeb.Api.GroupController do
  use RelearnTogetherWeb, :controller

  alias RelearnTogether.Groupings
  alias RelearnTogether.Cohorts
  alias RelearnTogether.Repo

  def index(conn, %{"activity_id" => activity_id}) do
    IO.inspect activity_id
    %{groups: groups} = Groupings.get_activity(activity_id) |> Repo.preload(:groups)
    render(conn, "index.json", groups: groups)
  end

  def create(conn, %{"activity_id" => activity_id}) do
    case Groupings.get_activity(activity_id) do
      nil ->
        render(conn, "error.json")
      activity ->
        {:ok, changeset} = Groupings.create_group(%{activity: activity})
        render(conn, "group.json", group: changeset)
    end
  end
end