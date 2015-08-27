defmodule Canobie.UsersController do
  use Canobie.Web, :controller

  alias Canobie.Repo
  alias Canobie.User

  def show(conn, %{"name" => name}) do
    case Canobie.User.get_by_name(name, [team: :state]) do
      nil ->
        conn |> put_status(404) |> json %{error: "not found"}
      user ->
        conn |> render "show.json", user: user
    end
  end
end

