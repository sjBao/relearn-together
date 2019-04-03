defmodule RelearnTogetherWeb.Api.GroupController do
  use RelearnTogetherWeb, :controller

  alias RelearnTogether.Groupings
  alias RelearnTogether.Cohorts
  alias RelearnTogether.Repo

  def index(conn, %{"activity_id" => activity_id}) do
    %{groups: groups} = Groupings.get_activity(activity_id) |> Repo.preload(:groups)
    render(conn, "index.json", groups: groups)
  end

  def create(conn, %{"activity_id" => activity_id}) do
    case Groupings.get_activity(activity_id) do
      nil ->
        render(conn, "error.json")
      activity ->
        {:ok, group} = Groupings.create_group(%{activity: activity})
        render(conn, "group.json", group: group)
    end
  end

  def delete(conn, %{"id" => group_id}) do
    case group_id |> Groupings.get_group! |> Groupings.delete_group do
      {:ok, group} ->
        render(conn, "group.json", group: group)
      _ ->
        render(conn, "error.json")
    end
  end
end