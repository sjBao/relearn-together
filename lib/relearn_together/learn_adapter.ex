defmodule RelearnTogether.LearnAdapter do
  def fetch_batch_students(batch_number) do
    HTTPoison.get("https://learn.co/api/batches/#{batch_number}/users?page=1", ["Authorization": "Bearer #{System.get_env("LEARN_TOKEN")}"])
  end
  
  def handle_response({:ok, %{status_code: 404}}) do
    {:error, "Batch not found, please verify your batch number and try again."}
  end

  def handle_response({:ok, %{body: body}}) do
    Jason.decode(body)
  end


  def handle_response({:error}) do
    {:error, "error"}
  end

  def filter_invalid_students(students) do
    Enum.filter(students, &valid_student?/1)
  end

  defp valid_student?(%{"admin" => admin, "first_name" => first_name, "github_username" => github_username}) do
    !admin && is_bitstring(first_name) && is_bitstring(github_username)
  end

end