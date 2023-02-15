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
  {name: "Blizzard World", type: "hybrid"}, {name: "Busan", type: "control"}, {name: "Dorado", type: "escort"},
  {name: "Eichenwalde", type: "hybrid"}, {name: "Havana", type: "escort"}, {name: "Hollywood", type: "hybrid"},
  {name: "Ilios", type: "control"}, {name: "Junkertown", type: "escort"}, {name: "King's Row", type: "hybrid"},
  {name: "Lijiang Tower", type: "control"}, {name: "Nepal", type: "control"}, {name: "Numbani", type: "hybrid"},
  {name: "Oasis", type: "control"}, {name: "Rialto", type: "escort"}, {name: "Route 66", type: "escort"},
  {name: "Watchpoint: Gibraltar", type: "escort"}, {name: "Circuit Royal", type: "escort"},
  {name: "Midtown", type: "hybrid"}, {name: "Paraiso", type: "hybrid"}, {name: "Colosseo", type: "push"},
  {name: "Esperanca", type: "push"}, {name: "New Queen Street", type: "push"}, {name: "Antarctic Peninsula", type: "control"}
]

puts "Creating user with email: a@a.a and password secret"

User.Create(
  email: "a@a.a",
  password: "secret",
  gamertag: "slayer69"
)

puts "building database of all overwatch Heroes"

heroes.each do |hero|
  Hero.create(
    name: hero.name,
    role: hero.role
  )
  puts "made #{Hero.last.name}"
end

puts "Heroes database built"
puts "Building database of all overwatch competitive maps"

maps.each do |map|
  Map.create(
    name: map.name,
    type: map.type
  )
  puts "made #{Map.last.name}"
end

puts "Maps database built"
