defmodule Canobie.Task do
  def tasks do
    [
      %{
        id: "fried-dough",
        name: "Eat fried dough",
        points: 20
      },

      %{
        id: "dough-twist",
        name: "Eat fried dough, then ride the Turkish Twist",
        points: 75
      },

      %{
        id: "beer",
        name: "Breakfast beer",
        points: 50
      },

      %{
        id: "monroe",
        name: "Spot Marilyn Monroe",
        points: 50
      },

      %{
        id: "sepia",
        name: "Get a Wild West photo taken of your team",
        points: 100
      },

      %{
        id: "flume-pic",
        name: "Take a team picture on the Log Flume",
        points: 100
      },

      %{
        id: "soaked",
        name: "Get completely soaked",
        points: 150
      },

      %{
        id: "pinball",
        name: "Play some pinball",
        points: 50
      },

      %{
        id: "arcade",
        name: "Play a vintage arcade game",
        points: 50
      },

      %{
        id: "skeeball",
        name: "Win some Skee-Ball tickets",
        points: 50
      },

      %{
        id: "guns",
        name: "Shoot guns",
        points: 50
      },

      %{
        id: "three",
        name: "Sink a Three-Pointer",
        points: 100
      },

      %{
        id: "softserve",
        name: "Spoil your appetite with soft-serve ice cream",
        points: 50
      },

      %{
        id: "tantrum",
        name: "Find a child having a complete meltdown",
        points: 50
      },

      %{
        id: "penny",
        name: "Toss a penny in the wishing well",
        points: 50
      },

      %{
        id: "dots",
        name: "Dive into some Dippin' Dots",
        points: 50
      },

      %{
        id: "bigfoot",
        name: "Find Bigfoot",
        points: 50
      },

      %{
        id: "tailgate",
        name: "Tailgate in the parking lot",
        points: 100
      },

      %{
        id: "evidence",
        name: "Find and photograph evidence of a defunct Canobie coaster",
        points: 100
      },

      %{
        id: "fivedough",
        name: "Eat more than five fried doughs per person",
        points: 2000
      },

      %{
        id: "stuffed",
        name: "Win a stuffed animal",
        points: 100
      },

      %{
        id: "mating-ritual",
        name: "Find under-13 kids flirting with each other",
        points: 100
      }
    ]
  end

  def points_by_task do
    Enum.reduce(tasks, %{}, fn(r, acc) -> Map.put(acc, r[:id], r[:points]) end)
  end

end