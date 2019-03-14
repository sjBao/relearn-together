defmodule RelearnTogetherWeb.PageController do
  use RelearnTogetherWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
