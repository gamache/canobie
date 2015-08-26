defmodule Canobie.StatesController do
  use Canobie.Web, :controller

  alias Canobie.Repo
  alias Canobie.State

  def show(conn, %{"name" => name}) do
    case State.get_by_user_name(name) do
      nil ->
        conn |> put_status(404) |> json error: "not found"
      state ->
        conn |> render "show.json", state: state
    end
  end
end
