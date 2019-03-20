defmodule RelearnTogether.CohortsTest do
  use RelearnTogether.DataCase

  alias RelearnTogether.Cohorts

  describe "campuses" do
    alias RelearnTogether.Cohorts.Campus

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def campus_fixture(attrs \\ %{}) do
      {:ok, campus} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cohorts.create_campus()

      campus
    end

    test "list_campuses/0 returns all campuses" do
      campus = campus_fixture()
      assert Cohorts.list_campuses() == [campus]
    end

    test "get_campus!/1 returns the campus with given id" do
      campus = campus_fixture()
      assert Cohorts.get_campus!(campus.id) == campus
    end

    test "create_campus/1 with valid data creates a campus" do
      assert {:ok, %Campus{} = campus} = Cohorts.create_campus(@valid_attrs)
      assert campus.name == "some name"
    end

    test "create_campus/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cohorts.create_campus(@invalid_attrs)
    end

    test "update_campus/2 with valid data updates the campus" do
      campus = campus_fixture()
      assert {:ok, %Campus{} = campus} = Cohorts.update_campus(campus, @update_attrs)
      assert campus.name == "some updated name"
    end

    test "update_campus/2 with invalid data returns error changeset" do
      campus = campus_fixture()
      assert {:error, %Ecto.Changeset{}} = Cohorts.update_campus(campus, @invalid_attrs)
      assert campus == Cohorts.get_campus!(campus.id)
    end

    test "delete_campus/1 deletes the campus" do
      campus = campus_fixture()
      assert {:ok, %Campus{}} = Cohorts.delete_campus(campus)
      assert_raise Ecto.NoResultsError, fn -> Cohorts.get_campus!(campus.id) end
    end

    test "change_campus/1 returns a campus changeset" do
      campus = campus_fixture()
      assert %Ecto.Changeset{} = Cohorts.change_campus(campus)
    end
  end
end
