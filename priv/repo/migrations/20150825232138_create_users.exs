defmodule Canobie.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :team_id, references(:teams)
      timestamps
    end
  end
end
