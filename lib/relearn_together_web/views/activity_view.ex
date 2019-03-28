defmodule RelearnTogetherWeb.ActivityView do
  use RelearnTogetherWeb, :view

  def render("scripts.html", _assigns) do
    ~s{
      <script>
      </script>
    } |> raw
  end
end
