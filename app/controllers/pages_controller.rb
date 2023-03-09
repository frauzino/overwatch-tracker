class PagesController < ApplicationController
  before_action :set_matches_played, only: %i[home match_win_rate]
  before_action :match_win_rates, only: %i[home]
  before_action :hero_win_rates, only: %i[home]
  before_action :map_win_rates, only: %i[home]

  def home
    @matches = Match.all
    @match = Match.new
    @match_count = @matches.map { |match| [match.map, match.hero]}.tally
    @maps = Map.all
    @map_names = @maps.map(&:name)
    @maps_played = (@matches.map(&:map)).uniq
    @map_count = (@matches.map(&:map)).tally
    @heroes = Hero.all
    @hero_names = @heroes.map(&:name)
    @heroes_played = (@matches.map(&:hero)).uniq
    @hero_count = (@matches.map(&:hero)).tally
  end

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
    @matches_played.each do |match|
      matches = Match.where(hero_id: match.hero)
      count = matches.count
      wins = matches.where(win: true).count.to_f
      @hero_win_rates << "#{(wins / count * 100).to_i}%"
    end
    return @hero_win_rates
  end

  def map_win_rates
    @map_win_rates = []
    @matches_played.each do |match|
      matches = Match.where(map_id: match.map)
      count = matches.count
      wins = matches.where(win: true).count.to_f
      @map_win_rates << "#{(wins / count * 100).to_i}%"
    end
    return @map_win_rates
  end

  private

  def set_matches_played
    @matches_played = Match.all.uniq { |match| [match.map, match.hero] }
  end
end
