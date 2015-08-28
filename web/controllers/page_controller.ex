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
        conn |> assign(:team_id, user.team_id) |> render "user.html"
    end
  end

  def admin(conn, _params) do
    teams = Canobie.Repo.all from t in Canobie.Team, preload: :state
    scores_by_team = Enum.reduce(teams, %{}, fn(t, acc) ->
      Map.put(acc, t, Canobie.State.score(t.state))
    end)
    sorted_scores = Enum.sort(scores_by_team, fn({_,a}, {_,b}) -> a > b end)
    conn = assign(conn, :scores, sorted_scores)
    render conn, "admin.html"
  end
end
