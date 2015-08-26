defmodule Canobie.UsersView do
  use Canobie.Web, :view

  alias Canobie.Endpoint
  import Canobie.Router.Helpers

  def render("show.json", %{user: user}) do
    %{
      name: user.name,
      team: user.team.name,
      _links: %{
        state: %{
          href: states_path(Endpoint, :show, user.name)
        }
      }
    }
  end
end

