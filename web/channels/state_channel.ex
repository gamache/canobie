defmodule Canobie.StateChannel do
  use Phoenix.Channel

  intercept ["update"]

  def join("state:" <> team_id, _auth_msg, socket) do
    socket = assign(socket, :team_id, team_id)
    case Canobie.State.get_by_team_id(team_id) do
      nil ->
        {:ok, %{state: %{}, score: 0}, socket}
      state ->
        {:ok, %{state: state.state, score: Canobie.Score.score(state)}, socket}
    end
  end

  def handle_in("update", updates, socket) do
    case Canobie.State.get_by_team_id(socket.assigns[:team_id]) do
      nil ->
        broadcast! socket, "update", %{poop: true}
      state ->
        state = state
                |> Canobie.State.apply_updates(updates)
                |> Canobie.Repo.update!
        broadcast! socket, "update", %{state: state.state, score: Canobie.Score.score(state)}
    end
    #broadcast! socket, "update", updates
    {:noreply, socket}
  end

  def handle_out("update", payload, socket) do
    push socket, "update", payload
    {:noreply, socket}
  end
end

