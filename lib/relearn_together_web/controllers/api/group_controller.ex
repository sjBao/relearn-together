defmodule RelearnTogetherWeb.Api.GroupController do
  use RelearnTogetherWeb, :controller

  alias RelearnTogether.Groupings
  alias RelearnTogether.Cohorts
  alias RelearnTogether.Repo

  def create(conn, params) do
    activity = Groupings.get_activity!(params["activity_id"]) |> Repo.preload(:groups)
    changeset = Groupings.create_group
    IO.inspect changeset
    IO.inspect "=============="
    render conn
  end
end