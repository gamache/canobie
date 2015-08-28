defmodule Canobie.Hunt do
  def points_by_id do
    Map.merge(Canobie.Task.points_by_task, Canobie.Rides.points_by_ride)
  end
end
