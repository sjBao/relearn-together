defmodule RelearnTogetherWeb.StudentController do
  use RelearnTogetherWeb, :controller
  alias RelearnTogether.Repo
  alias RelearnTogether.Cohorts
  alias RelearnTogether.Cohorts.Student

  def index(conn, _params) do
    students = Cohorts.list_students()
    render(conn, "index.html", students: students)
  end

  def new(conn, %{"cohort_id" => cohort_id}) do
    changeset = Cohorts.change_student(%Student{})
    conn
    |> assign(:cohorts, Cohorts.list_sibling_cohorts(cohort_id))
    |> assign(:cohort_id, cohort_id)
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"student" => student_params}) do
    case Cohorts.create_student(student_params) do
      {:ok, student} ->
        conn
        |> put_flash(:info, "Student created successfully.")
        |> redirect(to: Routes.student_path(conn, :show, student))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    student = Cohorts.get_student!(id)
    render(conn, "show.html", student: student)
  end

  def edit(conn, %{"cohort_id" => cohort_id, "id" => id}) do
    student = Cohorts.get_student!(id)
    changeset = Cohorts.change_student(student)
    conn
    |> assign(:cohorts, Cohorts.list_sibling_cohorts(cohort_id))
    |> render("edit.html", student: student, changeset: changeset)
  end

  def update(conn, %{"id" => id, "student" => student_params}) do
    student = Cohorts.get_student!(id)

    case Cohorts.update_student(student, student_params) do
      {:ok, student} ->
        conn
        |> put_flash(:info, "Student updated successfully.")
        |> redirect(to: Routes.student_path(conn, :show, student))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", student: student, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    student = Cohorts.get_student!(id)
    {:ok, _student} = Cohorts.delete_student(student)

    conn
    |> put_flash(:info, "Student deleted successfully.")
    |> redirect(to: Routes.student_path(conn, :index))
  end
end
