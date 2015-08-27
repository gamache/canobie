defmodule Canobie.PageController do
  use Canobie.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def user(conn, %{"name" => name}) do
    case Canobie.User.get_by_name(name) do
      nil ->
        conn |> put_status(404) |> render Canobie.ErrorView, "404.html"
      user ->
        render conn, "user.html"
    end
  end
end
