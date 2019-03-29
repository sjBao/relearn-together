defmodule RelearnTogetherWeb.Router do
  use RelearnTogetherWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug CORSPlug, origin: ["http://localhost:8000"]
  end

  scope "/api", RelearnTogetherWeb, as: :api do
    pipe_through :api

    resources "/activities", ActivityController, only: [] do
      resources "/groups", GroupController, only: [:create]
    end
  end

  scope "/", RelearnTogetherWeb do
    pipe_through :browser

    get "/", PageController, :index
    # resources "/cohorts", CohortController
    resources "/cohorts", CohortController do
      resources "/students", StudentController
      resources "/activities", ActivityController
    end

    resources "students", StudentController, only: [:show]
    get "/cohorts/:cohort_id/fetch_batch_students",  CohortController, :fetch_batch_students, as: "fetch_batch_students"
  end

  # Other scopes may use custom stacks.
  # scope "/api", RelearnTogetherWeb do
  #   pipe_through :api
  # end
end
