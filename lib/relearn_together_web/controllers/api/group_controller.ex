defmodule RelearnTogetherWeb.Api.GroupController do
  use RelearnTogetherWeb, :controller

  alias RelearnTogether.Groupings
  alias RelearnTogether.Cohorts
  alias RelearnTogether.Repo

  def create(conn, %{"activity_id" => activity_id}) do
    case Groupings.get_activity(17) do
      nil ->
        render(conn, "error.json")
      activity ->
        {:ok, changeset} = Groupings.create_group(%{activity: activity})
        render(conn, "create.json", changeset: changeset)
    end
  end
end