defmodule RelearnTogetherWeb.CohortView do
  use RelearnTogetherWeb, :view

  def uk_date_select(form, field, opts \\ []) do
    builder = fn b ->
      ~e"""
      <%= b.(:month, opts) %> 
      <%= b.(:day, opts) %> 
      <%= b.(:year, opts) %>
      """
    end
    date_select(form, field, [builder: builder] ++ opts)
  end

  def format_cohort_start_date(%Date{year: year, month: month, day: day}) do
    "#{month}-#{day}-#{year}"
  end

  def cohort_number(%Date{year: year, month: month, day: day}) do
    String.pad_leading("#{month}", 2, "0")
    <> "#{day}"
    <> String.slice("#{year}", -2, 2)
  end

  def cohort_name(%{start_date: start_date, campus: campus}) do
    "#{campus && campus.name}-web-#{cohort_number(start_date)}" |> String.downcase
  end
end
