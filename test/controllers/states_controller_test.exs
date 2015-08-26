defmodule Canobie.StatesControllerTest do
  use Canobie.ConnCase

  test "GET /api/users/:name/state" do
    conn = get conn(), "/api/users/root/state"
    json = response(conn, 200) |> Poison.decode!
    assert json["state"] == %{}
  end

  test "PATCH /api/users/:name/state" do
    conn = conn()
            |> put_req_header("content-type", "application/json")
            |> patch("/api/users/root/state", "{\"state\": {\"a\": 1, \"b\": 2}}")
    json = response(conn, 200) |> Poison.decode!
    assert json["state"] == %{"a" => 1, "b" => 2}

    conn = conn()
            |> put_req_header("content-type", "application/json")
            |> patch("/api/users/root/state", "{\"state\": {\"a\": 3, \"c\": 4}}")
    json = response(conn, 200) |> Poison.decode!
    assert json["state"] == %{"a" => 3, "b" => 2, "c" => 4}
  end
end


