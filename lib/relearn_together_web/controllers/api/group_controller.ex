defmodule RelearnTogetherWeb.Api.GroupController do
  use RelearnTogetherWeb, :controller

  def create(conn, params) do
    IO.inspect conn

    render conn
  end
end