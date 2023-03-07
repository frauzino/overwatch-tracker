class PagesController < ApplicationController
  def home
    @matches = Match.all
    @match = Match.new
    @maps = Map.all
    @map_names = @maps.map(&:name)
    @maps_played = (@matches.map(&:map)).uniq
    @map_count = (@matches.map(&:map)).tally
    @heroes = Hero.all
    @hero_names = @heroes.map(&:name)
    @heroes_played = (@matches.map(&:hero)).uniq
    @hero_count = (@matches.map(&:hero)).tally
  end
end
