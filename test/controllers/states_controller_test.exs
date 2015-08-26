defmodule Canobie.StatesControllerTest do
  use Canobie.ConnCase

  test "GET /api/users/:name/state" do
    conn = get conn(), "/api/users/root/state"
    json = response(conn, 200) |> Poison.decode!
    assert json["state"] == %{}
  end
end


