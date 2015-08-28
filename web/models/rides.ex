defmodule Canobie.Rides do
  def coasters do
    [
      %{
        id: "yankee",
        name: "Yankee Cannonball",
        desc: "Classic wooden out-and-back coaster dating to 1933.  The best ride at Canobie.",
        points: 50
      },

      %{
        id: "corkscrew",
        name: "Corkscrew",
        desc: "An early steel looping coaster from the mid-70's.",
        points: 20
      },

      %{
        id: "untamed",
        name: "Untamed",
        desc: "Modern 'Eurofighter' coaster with the steepest drop in the Northeast.",
        points: 40
      }
    ]
  end

  def water_rides do
    [
      %{
        id: "boston-tea-party",
        name: "Boston Tea Party",
        desc: "A simple ride designed to completely soak riders and bystanders alike.",
        points: 50
      },

      %{
        id: "castaway",
        name: "Castaway Island",
        desc: "A water playground.",
        points: 20
      },

      %{
        id: "flume",
        name: "Log Flume",
        desc: "A logging-themed water ride built around a sawmill.",
        points: 40
      },

      %{
        id: "timber",
        name: "Tall Timber Splash",
        desc: "A double waterslide coaster.",
        points: 30
      }
    ]
  end

  def car_rides do
    [
      %{
        id: "antique-cars",
        name: "Antique Cars",
        desc: "Drive it like you stole it, in 1930.",
        points: 20
      },

      %{
        id: "canobie-500",
        name: "Canobie 500",
        desc: "Drive it like you stole it.",
        points: 20
      },

      %{
        id: "dodgem",
        name: "Dodgem",
        desc: "Drive it like you stole it, head-on into your teammates.",
        points: 50
      }
    ]
  end

  def spinning_rides do
    [
      %{
        id: "turkish-twist",
        name: "Turkish Twist",
        desc: "It's like a people-centrifuge.",
        points: 50
      },

      %{
        id: "psychodrome",
        name: "Psychodrome",
        desc: "A geodesic dome with a Scrambler in it.",
        points: 40
      },

      %{
        id: "twist",
        name: "Twist and Shout",
        desc: "Canobie's Tilt-a-Whirl.",
        points: 30
      },

      %{
        id: "roundup",
        name: "Zero Gravity",
        desc: "A tilting Round-Up ride.",
        points: 30
      },

      %{
        id: "xtreme",
        name: "Xtreme Frisbee",
        desc: "It spins, it lifts, part of it is disc-shaped.",
        points: 30
      },

      %{
        id: "wipeout",
        name: "Wipeout",
        desc: "It spins, it tilts, it used to be the Kosmojets.",
        points: 30
      },

      %{
        id: "skater",
        name: "Skater",
        desc: "Not really all that much like skateboarding.",
        points: 30
      },

      %{
        id: "carousel",
        name: "Carousel",
        desc: "A lovely antique carousel from 1902, featuring Wurlitzer sound.",
        points: 30
      }
    ]
  end

  def aerial_rides do
    [
      %{
        id: "pirata",
        name: "Pirata",
        desc: "A classic pirate ship ride.",
        points: 50
      },

      %{
        id: "starblaster",
        name: "Starblaster",
        desc: "A 'Double Shot' up-and-down ride.",
        points: 40
      },

      %{
        id: "davinci",
        name: "da Vinci's Dream",
        desc: "Soaring swing ride overlooking Canobie Lake.",
        points: 40
      },

      %{
        id: "ferris",
        name: "Giant Sky Wheel",
        desc: "You guessed it, it's a Ferris wheel.",
        points: 30
      },

      %{
        id: "skyride",
        name: "Sky Ride",
        desc: "A leisurely ski-lift ride across the park.",
        points: 30
      }
    ]
  end


  def rides do
    [
      %{name: "Coasters", rides: coasters},
      %{name: "Water",    rides: water_rides},
      %{name: "Cars",     rides: car_rides},
      %{name: "Spinning", rides: spinning_rides},
      %{name: "Aerial",   rides: aerial_rides}
    ]
  end

end
