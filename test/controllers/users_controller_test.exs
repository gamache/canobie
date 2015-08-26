defmodule Canobie.UsersControllerTest do
  use Canobie.ConnCase

  test "GET /api/users/:name" do
    conn = get conn(), "/api/users/root"
    json = response(conn, 200) |> Poison.decode!
    assert json["name"] == "root"
    assert json["_links"]["state"] == %{"href" => "/api/users/root/state"}
  end
end

