ExUnit.start
import Ecto.Query, only: [from: 2]

Mix.Task.run "ecto.create", ["--quiet"]
Mix.Task.run "ecto.migrate", ["--quiet"]

Canobie.Repo.delete_all(from u in Canobie.User, where: u.team_id == 0)
Canobie.Repo.delete_all(from s in Canobie.State, where: s.team_id == 0)
Canobie.Repo.delete_all(from t in Canobie.Team, where: t.id == 0)

Canobie.Repo.insert!(%Canobie.Team{id: 0, name: "Team 0"})
Canobie.Repo.insert!(%Canobie.User{id: 0, name: "root", team_id: 0})
Canobie.Repo.insert!(%Canobie.State{id: 0, state: %{}, team_id: 0})

Ecto.Adapters.SQL.begin_test_transaction(Canobie.Repo)

