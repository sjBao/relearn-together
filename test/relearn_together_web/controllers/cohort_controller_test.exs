defmodule RelearnTogetherWeb.CohortControllerTest do
  use RelearnTogetherWeb.ConnCase

  alias RelearnTogether.Cohorts

  @create_attrs %{batch_number: 42, start_date: ~D[2010-04-17]}
  @update_attrs %{batch_number: 43, start_date: ~D[2011-05-18]}
  @invalid_attrs %{batch_number: nil, start_date: nil}

  def fixture(:cohort) do
    {:ok, cohort} = Cohorts.create_cohort(@create_attrs)
    cohort
  end

  describe "index" do
    test "lists all cohorts", %{conn: conn} do
      conn = get(conn, Routes.cohort_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cohorts"
    end
  end

  describe "new cohort" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cohort_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cohort"
    end
  end

  describe "create cohort" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cohort_path(conn, :create), cohort: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cohort_path(conn, :show, id)

      conn = get(conn, Routes.cohort_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cohort"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cohort_path(conn, :create), cohort: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cohort"
    end
  end

  describe "edit cohort" do
    setup [:create_cohort]

    test "renders form for editing chosen cohort", %{conn: conn, cohort: cohort} do
      conn = get(conn, Routes.cohort_path(conn, :edit, cohort))
      assert html_response(conn, 200) =~ "Edit Cohort"
    end
  end

  describe "update cohort" do
    setup [:create_cohort]

    test "redirects when data is valid", %{conn: conn, cohort: cohort} do
      conn = put(conn, Routes.cohort_path(conn, :update, cohort), cohort: @update_attrs)
      assert redirected_to(conn) == Routes.cohort_path(conn, :show, cohort)

      conn = get(conn, Routes.cohort_path(conn, :show, cohort))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, cohort: cohort} do
      conn = put(conn, Routes.cohort_path(conn, :update, cohort), cohort: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cohort"
    end
  end

  describe "delete cohort" do
    setup [:create_cohort]

    test "deletes chosen cohort", %{conn: conn, cohort: cohort} do
      conn = delete(conn, Routes.cohort_path(conn, :delete, cohort))
      assert redirected_to(conn) == Routes.cohort_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cohort_path(conn, :show, cohort))
      end
    end
  end

  defp create_cohort(_) do
    cohort = fixture(:cohort)
    {:ok, cohort: cohort}
  end
end
