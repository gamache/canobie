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

Canobie.Repo.insert!(%Canobie.Team{name: "Team 0", id: 0})
Canobie.Repo.insert!(%Canobie.User{name: "root", team_id: 0})

