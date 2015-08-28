defmodule Canobie.StateChannel do
  use Phoenix.Channel

  def join("state:" <> team_id, _auth_msg, socket) do
    {:ok, socket}
  end

  def handle_in("update", %{"body" => body}, socket) do
    broadcast! socket, "update", %{body: body}
    {:noreply, socket}
  end

  def handle_out("update", payload, socket) do
    push socket, "update", payload
    {:noreply, socket}
  end
end
