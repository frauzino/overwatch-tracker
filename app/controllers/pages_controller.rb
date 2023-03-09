class PagesController < ApplicationController
  before_action :set_matches_played, only: %i[home match_win_rates]
  before_action :set_heroes_played, only: %i[home hero_win_rates]
  before_action :set_maps_played, only: %i[home map_win_rates]
  before_action :match_win_rates, only: %i[home]
  before_action :hero_win_rates, only: %i[home]
  before_action :map_win_rates, only: %i[home]

  def home
    @matches = Match.all
    @match = Match.new
    @match_count = @matches.map { |match| [match.map, match.hero]}.tally
    @maps = Map.all
    @map_names = @maps.map(&:name)
    @map_count = @matches.map(&:map).tally
    @heroes = Hero.all
    @hero_names = @heroes.map(&:name)
    @hero_count = @matches.map(&:hero).tally
  end

  private

  def match_win_rates
    @match_win_rates = []
    @matches_played.each do |match|
      matches = Match.where(hero_id: match.hero, map_id: match.map)
      count = matches.count
      wins = matches.where(win: true).count.to_f
      @match_win_rates << "#{(wins / count * 100).to_i}%"
    end
    return @match_win_rates
  end

  def hero_win_rates
    @hero_win_rates = []
    @heroes_played.each do |hero|
      matches = Match.where(hero_id: hero)
      count = matches.count
      wins = matches.where(win: true).count.to_f
      @hero_win_rates << "#{(wins / count * 100).to_i}%"
    end
    return @hero_win_rates
  end

  def map_win_rates
    @map_win_rates = []
    @maps_played.each do |map|
      matches = Match.where(map_id: map)
      count = matches.count
      wins = matches.where(win: true).count.to_f
      @map_win_rates << "#{(wins / count * 100).to_i}%"
    end
    return @map_win_rates
  end

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
