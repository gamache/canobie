defmodule Canobie.User do
  use Ecto.Model

  schema "users" do
    field :name
    belongs_to :team, Canobie.Team
    timestamps
  end

  @required_fields ~w(name team_id)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def get_by_name(name, preload \\ []) do
    from(u in Canobie.User,
      where: u.name == ^name,
      preload: ^preload)
    |> Canobie.Repo.all
    |> List.first
  end

end
