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

  describe "mods" do
    alias RelearnTogether.Cohorts.Mod

    @valid_attrs %{number: 42}
    @update_attrs %{number: 43}
    @invalid_attrs %{number: nil}

    def mod_fixture(attrs \\ %{}) do
      {:ok, mod} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cohorts.create_mod()

      mod
    end

    test "list_mods/0 returns all mods" do
      mod = mod_fixture()
      assert Cohorts.list_mods() == [mod]
    end

    test "get_mod!/1 returns the mod with given id" do
      mod = mod_fixture()
      assert Cohorts.get_mod!(mod.id) == mod
    end

    test "create_mod/1 with valid data creates a mod" do
      assert {:ok, %Mod{} = mod} = Cohorts.create_mod(@valid_attrs)
      assert mod.number == 42
    end

    test "create_mod/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cohorts.create_mod(@invalid_attrs)
    end

    test "update_mod/2 with valid data updates the mod" do
      mod = mod_fixture()
      assert {:ok, %Mod{} = mod} = Cohorts.update_mod(mod, @update_attrs)
      assert mod.number == 43
    end

    test "update_mod/2 with invalid data returns error changeset" do
      mod = mod_fixture()
      assert {:error, %Ecto.Changeset{}} = Cohorts.update_mod(mod, @invalid_attrs)
      assert mod == Cohorts.get_mod!(mod.id)
    end

    test "delete_mod/1 deletes the mod" do
      mod = mod_fixture()
      assert {:ok, %Mod{}} = Cohorts.delete_mod(mod)
      assert_raise Ecto.NoResultsError, fn -> Cohorts.get_mod!(mod.id) end
    end

    test "change_mod/1 returns a mod changeset" do
      mod = mod_fixture()
      assert %Ecto.Changeset{} = Cohorts.change_mod(mod)
    end
  end

  describe "students" do
    alias RelearnTogether.Cohorts.Student

    @valid_attrs %{first_name: "some first_name", github_handle: "some github_handle", last_name: "some last_name", preferred_name: "some preferred_name"}
    @update_attrs %{first_name: "some updated first_name", github_handle: "some updated github_handle", last_name: "some updated last_name", preferred_name: "some updated preferred_name"}
    @invalid_attrs %{first_name: nil, github_handle: nil, last_name: nil, preferred_name: nil}

    def student_fixture(attrs \\ %{}) do
      {:ok, student} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cohorts.create_student()

      student
    end

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert Cohorts.list_students() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert Cohorts.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      assert {:ok, %Student{} = student} = Cohorts.create_student(@valid_attrs)
      assert student.first_name == "some first_name"
      assert student.github_handle == "some github_handle"
      assert student.last_name == "some last_name"
      assert student.preferred_name == "some preferred_name"
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cohorts.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      assert {:ok, %Student{} = student} = Cohorts.update_student(student, @update_attrs)
      assert student.first_name == "some updated first_name"
      assert student.github_handle == "some updated github_handle"
      assert student.last_name == "some updated last_name"
      assert student.preferred_name == "some updated preferred_name"
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = Cohorts.update_student(student, @invalid_attrs)
      assert student == Cohorts.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = Cohorts.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Cohorts.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = Cohorts.change_student(student)
    end
  end
end
