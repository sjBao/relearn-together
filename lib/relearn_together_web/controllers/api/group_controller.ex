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

  def update(conn, %{"activity_id" => activity_id, "id" => group_id, "student_id" => student_id} = params) do
    IO.inspect params
    IO.inspect "+++++++++++++++++++++++++++++++++++++++++"
    params
    |> Groupings.is_student_grouped?
    |> Groupings.create_or_update_group_student(%{ activity_id: activity_id, student_id: student_id, group_id: group_id })

    render(conn, "group.json", group: Groupings.get_group!(group_id))
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