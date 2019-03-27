defmodule RelearnTogether.GroupingsTest do
  use RelearnTogether.DataCase

  alias RelearnTogether.Groupings

  describe "labels" do
    alias RelearnTogether.Groupings.Label

    @valid_attrs %{name: "some name", priority: 42}
    @update_attrs %{name: "some updated name", priority: 43}
    @invalid_attrs %{name: nil, priority: nil}

    def label_fixture(attrs \\ %{}) do
      {:ok, label} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Groupings.create_label()

      label
    end

    test "list_labels/0 returns all labels" do
      label = label_fixture()
      assert Groupings.list_labels() == [label]
    end

    test "get_label!/1 returns the label with given id" do
      label = label_fixture()
      assert Groupings.get_label!(label.id) == label
    end

    test "create_label/1 with valid data creates a label" do
      assert {:ok, %Label{} = label} = Groupings.create_label(@valid_attrs)
      assert label.name == "some name"
      assert label.priority == 42
    end

    test "create_label/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groupings.create_label(@invalid_attrs)
    end

    test "update_label/2 with valid data updates the label" do
      label = label_fixture()
      assert {:ok, %Label{} = label} = Groupings.update_label(label, @update_attrs)
      assert label.name == "some updated name"
      assert label.priority == 43
    end

    test "update_label/2 with invalid data returns error changeset" do
      label = label_fixture()
      assert {:error, %Ecto.Changeset{}} = Groupings.update_label(label, @invalid_attrs)
      assert label == Groupings.get_label!(label.id)
    end

    test "delete_label/1 deletes the label" do
      label = label_fixture()
      assert {:ok, %Label{}} = Groupings.delete_label(label)
      assert_raise Ecto.NoResultsError, fn -> Groupings.get_label!(label.id) end
    end

    test "change_label/1 returns a label changeset" do
      label = label_fixture()
      assert %Ecto.Changeset{} = Groupings.change_label(label)
    end
  end

  describe "activities" do
    alias RelearnTogether.Groupings.Activity

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def activity_fixture(attrs \\ %{}) do
      {:ok, activity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Groupings.create_activity()

      activity
    end

    test "list_activities/0 returns all activities" do
      activity = activity_fixture()
      assert Groupings.list_activities() == [activity]
    end

    test "get_activity!/1 returns the activity with given id" do
      activity = activity_fixture()
      assert Groupings.get_activity!(activity.id) == activity
    end

    test "create_activity/1 with valid data creates a activity" do
      assert {:ok, %Activity{} = activity} = Groupings.create_activity(@valid_attrs)
    end

    test "create_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groupings.create_activity(@invalid_attrs)
    end

    test "update_activity/2 with valid data updates the activity" do
      activity = activity_fixture()
      assert {:ok, %Activity{} = activity} = Groupings.update_activity(activity, @update_attrs)
    end

    test "update_activity/2 with invalid data returns error changeset" do
      activity = activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Groupings.update_activity(activity, @invalid_attrs)
      assert activity == Groupings.get_activity!(activity.id)
    end

    test "delete_activity/1 deletes the activity" do
      activity = activity_fixture()
      assert {:ok, %Activity{}} = Groupings.delete_activity(activity)
      assert_raise Ecto.NoResultsError, fn -> Groupings.get_activity!(activity.id) end
    end

    test "change_activity/1 returns a activity changeset" do
      activity = activity_fixture()
      assert %Ecto.Changeset{} = Groupings.change_activity(activity)
    end
  end

  describe "groups" do
    alias RelearnTogether.Groupings.Group

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Groupings.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Groupings.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Groupings.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Groupings.create_group(@valid_attrs)
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Groupings.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, %Group{} = group} = Groupings.update_group(group, @update_attrs)
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Groupings.update_group(group, @invalid_attrs)
      assert group == Groupings.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Groupings.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Groupings.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Groupings.change_group(group)
    end
  end
end
