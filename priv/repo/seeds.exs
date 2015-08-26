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

import Ecto.Query, only: [from: 2]

Canobie.Repo.delete_all(from u in Canobie.User, where: u.team_id == 0)
Canobie.Repo.delete_all(from s in Canobie.State, where: s.team_id == 0)
Canobie.Repo.delete_all(from t in Canobie.Team, where: t.id == 0)

Canobie.Repo.insert!(%Canobie.Team{id: 0, name: "Team 0"})
Canobie.Repo.insert!(%Canobie.User{id: 0, name: "root", team_id: 0})
Canobie.Repo.insert!(%Canobie.State{id: 0, state: %{}, team_id: 0})

