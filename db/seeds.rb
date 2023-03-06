# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

heroes = [
  {name: "Ana", role: "support"}, {name: "Ashe", role: "damage"}, {name: "Baptiste", role: "support"},
  {name: "Bastion", role: "damage"}, {name: "Brigitte", role: "support"}, {name: "Cassidy", role: "damage"},
  {name: "Doomfist", role: "tank"}, {name: "Echo", role: "damage"}, {name: "Genji", role: "damage"},
  {name: "Hanzo", role: "damage"}, {name: "Junkerqueen", role: "tank"}, {name: "Junkrat", role: "damage"},
  {name: "Kiriko", role: "support"}, {name: "Lucio", role: "support"}, {name: "Mei", role: "damage"},
  {name: "Mercy", role: "support"}, {name: "Moira", role: "support"}, {name: "Orisa", role: "tank"},
  {name: "Pharah", role: "damage"}, {name: "Ramattra", role: "tank"}, {name: "Reaper", role: "damage"},
  {name: "Reinhardt", role: "tank"}, {name: "Roadhog", role: "tank"}, {name: "Sigma", role: "tank"},
  {name: "Soldier:76", role: "damage"}, {name: "Sojourn", role: "damage"}, {name: "Sombra", role: "damage"},
  {name: "Symmetra", role: "damage"}, {name: "Torbjorn", role: "damage"}, {name: "Tracer", role: "damage"},
  {name: "Widowmaker", role: "damage"}, {name: "Winston", role: "tank"}, {name: "Wrecking Ball", role: "tank"},
  {name: "Zarya", role: "tank"}, {name: "Zenyatta", role: "tank"}
]

maps = [
  {name: "Blizzard World", category: "hybrid"}, {name: "Busan", category: "control"}, {name: "Dorado", category: "escort"},
  {name: "Eichenwalde", category: "hybrid"}, {name: "Havana", category: "escort"}, {name: "Hollywood", category: "hybrid"},
  {name: "Ilios", category: "control"}, {name: "Junkertown", category: "escort"}, {name: "King's Row", category: "hybrid"},
  {name: "Lijiang Tower", category: "control"}, {name: "Nepal", category: "control"}, {name: "Numbani", category: "hybrid"},
  {name: "Oasis", category: "control"}, {name: "Rialto", category: "escort"}, {name: "Route 66", category: "escort"},
  {name: "Watchpoint: Gibraltar", category: "escort"}, {name: "Circuit Royal", category: "escort"},
  {name: "Midtown", category: "hybrid"}, {name: "Paraiso", category: "hybrid"}, {name: "Colosseo", category: "push"},
  {name: "Esperanca", category: "push"}, {name: "New Queen Street", category: "push"}, {name: "Antarctic Peninsula", category: "control"}
]

puts "cleaning the DB"
Hero.destroy_all
Map.destroy_all
Match.destroy_all
User.destroy_all
puts "DB is clean!"

puts "Creating user with email: a@a.a and password secret"

User.create(
  email: "a@a.a",
  password: "secret",
  gamertag: "slayer69"
)

puts "building database of all overwatch Heroes"

heroes.each do |hero|
  Hero.create(
    name: hero[:name],
    role: hero[:role]
  )
  puts "made #{Hero.last.name}"
end

puts "Heroes database built"
puts "Building database of all overwatch competitive maps"

maps.each do |map|
  Map.create(
    name: map[:name],
    category: map[:category]
  )
  puts "made #{Map.last.name}"
end

puts "Maps database built"
