defmodule RelearnTogetherWeb.Api.GroupView do
  use RelearnTogetherWeb, :view

  alias RelearnTogetherWeb.Api.GroupView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, GroupView, "group.json")}
  end

  def render("group.json", %{user: user}) do
    %{data: render_one(user, GroupView, "group.json")}
  end

  def render("group.json", %{group: group}) do
    %{
      id: group.id
      
    }
  end
end