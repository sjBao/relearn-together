defmodule RelearnTogetherWeb.Api.GroupView do
  use RelearnTogetherWeb, :view

  alias RelearnTogetherWeb.Api.GroupView

  def render("index.json", %{groups: groups}) do
    render_many(groups, GroupView, "group.json")
  end

  def render("group.json", %{group: group}) do
    %{
      id: group.id
    }
  end
end