class PagesController < ApplicationController
  before_action :set_matches_played, only: %i[home]
  before_action :set_heroes_played, only: %i[home]
  before_action :set_maps_played, only: %i[home]

  def home
    @matches = Match.all
    @match = Match.new
    @maps = Map.all
    @heroes = Hero.all
  end

  private

  def set_matches_played
    @matches_played = Match.all.uniq { |match| [match.map, match.hero] }
  end

  def set_heroes_played
    @heroes_played = Match.all.map(&:hero).uniq
  end

  def set_maps_played
    @maps_played = Match.all.map(&:map).uniq
  end
end
