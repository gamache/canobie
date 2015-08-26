defmodule Canobie.UsersController do
  use Canobie.Web, :controller

  alias Canobie.Repo
  alias Canobie.User

  def show(conn, %{"name" => name}) do
    case Repo.all from u in User, where: u.name == ^name, preload: [:team] do
      [] ->
        conn |> put_status(404) |> json %{error: "not found"}
      [user] ->
        conn |> render "show.json", user: user
    end
  end
end

