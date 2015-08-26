defmodule Canobie.Team do
  use Ecto.Model

  schema "teams" do
    field :name
    has_many :users, Canobie.User
    has_one :state, Canobie.State
    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end

