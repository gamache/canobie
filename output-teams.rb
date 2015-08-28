#!/usr/bin/env ruby
require 'csv'

lists =
  "Bryn Adler,Alison Averill,Kevin Flanagan,Dan Sbordone,Dave Clinton,David Floyd,Derek McCaffrey,Greg Spaulding,Jaime Reynolds,Jamie Aliperti,Jason Greene,Brady Flanagan,Kelly McKinley,Kristin Cronin,Henry Cipolla,Lou Orfanos,Stephanie Holt,Matt Kaminski,Matt Virzi,Megan Marrs,Mihaela Popa,Will Catron,Raj Aggarwal,Rich Hawkes,Sabrina Carr,Sean Marshall,Mike Hebert,Liz Kavney,Shannon Davis,Sloan McCauley,Susie Castillo,Tom McMahon,Zahra Bukhari,Zak Kovat\n"+
  "Matt Gray,Greg Salmon,Craig Herman,DeRon Brown,Jason D'Souza,Sara Radkiewicz,Jeff Lopes,Ayal Spitz,Chris Rollock,Joanna Solmon,Michal Klos,Josh Todd,Chris Ciollaro,Brian Jacobel,Mike Goddard,Rebecca Paz,Marc Petito,Brian Suthoff,Adam Buggia,Colin Barry,Jeff Levine,Toby Lawrence,Matthew Dziuban,Wolfgang Therrien,Richard Marscher,Justin Rounds,Isaac Charny,Tristan Harward,Mike Clausen,Matt Patey,Derek Thompson,Josh Booth,Dwight Churchill,Shell Riehlin\n"+
  "Tony Wieczorek,Andrew Rollins,Zac Aghion,Prescott Murphy,Mohit Dilawari,Hongyang Liu,Bin Bo,Jacob Hilker,Jeremy Hahn,Matthew Barackman,Nate Tenczar,Rafael Mendiola,Jenn Page,Joel Rosen,Glen Lovett,Bobby Wayne,Ryan Casey,Pete Gamache,Marc Tollin,Ash Hepburn,Randy Dailey,Josh Cough,Konstantine Kruity,Chris Jelly,Yoni Samlan,Sandeep Ghael,Brian Zeligson,Richard Boccuzzi,Don McNamara,Frederico Gonzalez,Dave Hoch,Clay Kim,Art Avagyan,Ian Asaff\n"+
  "Alex Finn,Nikki Oliveri,Jack Leahy,Annum Munir,Trevor Pearson,Joe McIntyre,Miguel Canas,Trey Simmons,Kunal Kamra,Will Youmans,Derek D'Angelo,Mike Trigonis,Jake McKibben,Jen Tanenbaum,Kristina Lisacki,Anne Killelea,Pat Durant,Riley Hughes,Jon Lavalley,Ryan McDermott,Hacer Demiroers,Murugan Namasivayam,Chad McMIllan ,Emily Halpin,Amy Brink,Sarah Cox,Scott Bleczinski,Scott Scarpato ,Jake Liebrock,Jing Jang,Dan Flynn,Connor Gallo,Meaghan Sullivan,Ramon Penrose\n"


teams = []

CSV.parse(lists) do |row|
  row.each_with_index do |name, i|
    team_no = i + 1
    teams[team_no] ||= []
    names = name.split(/ /);
    username = (names[0][0] + names[-1]).downcase.gsub(/[^a-z]/, '')
    teams[team_no] << username
  end
end
teams.shift
teams.each_with_index do |team, i|
  puts "Canobie.Repo.insert!(%Canobie.Team{id: #{i+1}, name: \"Team #{i+1}\"})"
  puts "Canobie.Repo.insert!(%Canobie.State{team_id: #{i+1}, state: Canobie.State.starting_state})"
  team.each do |user|
    puts "Canobie.Repo.insert!(%Canobie.User{team_id: #{i+1}, name: \"#{user}\"})"
  end
end

