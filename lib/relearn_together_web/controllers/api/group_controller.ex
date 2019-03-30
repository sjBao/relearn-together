defmodule RelearnTogetherWeb.Api.GroupController do
  use RelearnTogetherWeb, :controller

  alias RelearnTogether.Groupings
  alias RelearnTogether.Cohorts

  def create(conn, params) do
    IO.inspect params
    IO.inspect "=============="
    render conn
  end
end