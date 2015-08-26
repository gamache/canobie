defmodule Canobie.StatesController do
  use Canobie.Web, :controller

  alias Canobie.Repo
  alias Canobie.State

  def show(conn, %{"name" => name}) do
    case State.get_by_user_name(name) do
      nil ->
        conn |> put_status(404) |> json %{error: "not found"}
      state ->
        conn |> render "show.json", state: state
    end
  end

  def update(conn, %{"name" => name, "state" => updates}) do
    case State.get_by_user_name(name) do
      nil ->
        conn |> put_status(404) |> json %{error: "not found"}
      state ->
        new_state = State.apply_updates(state, updates)
        Repo.update! new_state
        conn |> render "show.json", state: new_state
    end
  end

  def update(conn, _params) do
    conn |> put_status(422) |> json %{error: "the 'state' parameter is required"}
  end
end

