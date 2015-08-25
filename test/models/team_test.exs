defmodule Canobie.TeamTest do
  use Canobie.ModelCase

  alias Canobie.Team

  @valid_attrs %{name: "awesome team"}
  @invalid_attrs %{poo: "click"}

  test "changeset with valid attrs" do
    changeset = Team.changeset(%Team{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attrs" do
    changeset = Team.changeset(%Team{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with no attrs" do
    changeset = Team.changeset(%Team{}, %{})
    refute changeset.valid?
  end
end

