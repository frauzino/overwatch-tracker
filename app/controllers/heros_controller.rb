class HerosController < ApplicationController
  before_action :set_hero, only: %i[show]

  def index
    @heros = Hero.all
  end

  def create
    @hero = Hero.new(params)
    @hero.save
  end

  private

  def hero_params
    params.require(:name, :role, :win_rate)
  end

  def set_hero
    @hero = Hero.find(params[:id])
  end
end
