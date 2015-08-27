defmodule Canobie.StateChannel do
  use Phoenix.Channel

  def join("state:" <> team_id, _auth_msg, socket) do
    {:ok, socket}
  end
end
