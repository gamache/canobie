defmodule Canobie.UsersView do
  use Canobie.Web, :view

  def render("show.json", %{user: user}) do
    %{name: user.name,
      team: user.team.name}
  end
end
