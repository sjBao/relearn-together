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

  describe "cohorts" do
    alias RelearnTogether.Cohorts.Cohort

    @valid_attrs %{batch_number: 42, start_date: ~D[2010-04-17]}
    @update_attrs %{batch_number: 43, start_date: ~D[2011-05-18]}
    @invalid_attrs %{batch_number: nil, start_date: nil}

    def cohort_fixture(attrs \\ %{}) do
      {:ok, cohort} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cohorts.create_cohort()

      cohort
    end

    test "list_cohorts/0 returns all cohorts" do
      cohort = cohort_fixture()
      assert Cohorts.list_cohorts() == [cohort]
    end

    test "get_cohort!/1 returns the cohort with given id" do
      cohort = cohort_fixture()
      assert Cohorts.get_cohort!(cohort.id) == cohort
    end

    test "create_cohort/1 with valid data creates a cohort" do
      assert {:ok, %Cohort{} = cohort} = Cohorts.create_cohort(@valid_attrs)
      assert cohort.batch_number == 42
      assert cohort.start_date == ~D[2010-04-17]
    end

    test "create_cohort/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cohorts.create_cohort(@invalid_attrs)
    end

    test "update_cohort/2 with valid data updates the cohort" do
      cohort = cohort_fixture()
      assert {:ok, %Cohort{} = cohort} = Cohorts.update_cohort(cohort, @update_attrs)
      assert cohort.batch_number == 43
      assert cohort.start_date == ~D[2011-05-18]
    end

    test "update_cohort/2 with invalid data returns error changeset" do
      cohort = cohort_fixture()
      assert {:error, %Ecto.Changeset{}} = Cohorts.update_cohort(cohort, @invalid_attrs)
      assert cohort == Cohorts.get_cohort!(cohort.id)
    end

    test "delete_cohort/1 deletes the cohort" do
      cohort = cohort_fixture()
      assert {:ok, %Cohort{}} = Cohorts.delete_cohort(cohort)
      assert_raise Ecto.NoResultsError, fn -> Cohorts.get_cohort!(cohort.id) end
    end

    test "change_cohort/1 returns a cohort changeset" do
      cohort = cohort_fixture()
      assert %Ecto.Changeset{} = Cohorts.change_cohort(cohort)
    end
  end
end
