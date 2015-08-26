defmodule Canobie.StatesView do
  use Canobie.Web, :view

  alias Canobie.Endpoint
  import Canobie.Router.Helpers

  def render("show.json", %{state: state}) do
    %{
      state: state.state
    }
  end
end
