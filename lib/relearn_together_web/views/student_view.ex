defmodule RelearnTogetherWeb.StudentView do
  use RelearnTogetherWeb, :view
  alias RelearnTogether.Cohorts.Cohort

  def format_cohort_start_date(%Date{year: year, month: month, day: day}) do
    "#{month}-#{day}-#{year}"
  end

  def cohort_number(%Date{year: year, month: month, day: day}) do
    String.pad_leading("#{month}", 2, "0")
    <> String.pad_leading("#{day}", 2, "0")
    <> String.slice("#{year}", -2, 2)
  end

  def cohort_name(%Cohort{start_date: start_date, campus: campus}) do
    "#{campus && campus.name}-web-#{cohort_number(start_date)}" |> String.downcase
  end
end
