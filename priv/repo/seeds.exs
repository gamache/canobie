# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Canobie.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Canobie.Repo.delete!(%Canobie.User{id: 0})
Canobie.Repo.delete!(%Canobie.State{id: 0})
Canobie.Repo.delete!(%Canobie.Team{id: 0})

Canobie.Repo.insert!(%Canobie.Team{id: 0, name: "Team 0"})
Canobie.Repo.insert!(%Canobie.User{id: 0, name: "root", team_id: 0})
Canobie.Repo.insert!(%Canobie.State{id: 0, state: %{}, team_id: 0})

