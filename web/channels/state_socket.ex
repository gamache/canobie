defmodule Canobie.StateSocket do
  use Phoenix.Socket

  channel "state:*", Canobie.StateChannel
end

