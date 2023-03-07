class MatchesController < ApplicationController
  before_action :set_match, only: %i[show edit update destroy]
  before_action :set_maps_heroes_matches, only: %i[new create]
  before_action :set_map_hero, only: %i[new create]

  def index
    @matches = Matches.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.user = current_user
    @match.hero = @hero
    @match.map = @map
    if @match.save
      redirect_to root_path
    else
      render 'pages/home', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @match.update(match_params)
    redirect_to match_path(@match)
  end

  def destroy
    @match.destroy
    redirect_to root_path
  end

  private

  def match_params
    params.require(:match).permit(:hero_id, :map_id, :win)
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def set_map_hero
    @map = Map.find(params[:match][:map].to_i)
    @hero = Hero.find(params[:match][:hero].to_i)
  end

  def set_maps_heroes_matches
    @maps = Map.all
    @heroes = Hero.all
    @matches = Match.all
  end
end
