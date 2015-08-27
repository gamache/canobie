defmodule Canobie.StateSocket do
  use Phoenix.Socket

  channel "state:*", Canobie.StateChannel

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end

