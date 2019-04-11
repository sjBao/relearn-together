defmodule RelearnTogetherWeb.Api.GroupView do
  use RelearnTogetherWeb, :view

  alias RelearnTogetherWeb.Api.GroupView

  def render("index.json", %{groups: groups}) do
    render_many(groups, GroupView, "group.json")
  end

  def render("group.json", %{group: group, group_frequencies: group_frequencies}) do
    %{
      id: group.id,
      group_frequencies: group_frequencies
    }
  end

  def render("group.json", %{group: group}) do
    %{
      id: group.id
    }
  end

  def render("group_frequency.json", %{group_frequencies: group_frequencies}) do
    %{
      group_frequencies: group_frequencies
    }
  end
end