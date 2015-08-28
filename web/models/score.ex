defmodule Canobie.Score do
  def score(state) do
    base_score = Enum.reduce(state.state, 0, fn({k, v}, acc) ->
      points = Canobie.Hunt.points_by_id[k] || 0
      acc + points * v
    end)

    ride_groups = Enum.map(Canobie.Rides.categories, fn(c) -> c[:rides] end)

    base_score +
      Enum.sum(Enum.map(ride_groups, fn(g) -> bonus(state, g) end)) +
      tasks_bonus(state)
  end

  def tasks_bonus(state) do
    100 * bonus(state, Canobie.Task.tasks, 3) +
      200 * bonus(state, Canobie.Task.tasks, 6) +
      300 * bonus(state, Canobie.Task.tasks, 9)
  end

  def bonus(state, group) do
    100 * bonus(state, group, 3) +
      300 * bonus(state, group, Enum.count(group))
  end

  # returns 1 or 0
  def bonus(state, group, min) do
    bonus(state, group, min, 0)
  end

  # returns 1 or 0
  def bonus(state, group, min, acc) do
    if acc >= min do
      1
    else
      case group do
        [] -> 0
        [head | tail] ->
          bonus(state, tail, min, acc + (state.state[head[:id]] || 0))
      end
    end
  end

end

