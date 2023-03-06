class PagesController < ApplicationController
  def home
    @maps = Map.all
    @heroes = Hero.all
    @matches = Match.all
  end
end
