defmodule Canobie.UserTest do
  use Canobie.ModelCase

  alias Canobie.User

  test "changeset with valid attrs" do
    changeset = User.changeset(%User{}, %{name: "someone", team_id: 1})
    assert changeset.valid?
  end

  test "changeset with no team fails" do
    changeset = User.changeset(%User{}, %{name: "someone"})
    refute changeset.valid?
  end

  test "changeset with no name fails" do
    changeset = User.changeset(%User{}, %{team_id: 22})
    refute changeset.valid?
  end
end
