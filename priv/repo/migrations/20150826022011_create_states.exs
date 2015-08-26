defmodule Canobie.Repo.Migrations.CreateStates do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :state, :map
      add :team_id, references(:teams)
      timestamps
    end
  end
end

