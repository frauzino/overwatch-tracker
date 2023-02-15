class MatchesController < ApplicationController
  before_action :set_match, only: %i[show edit update destroy]
  def index
    @matches = Matches.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(params)
    if @match.save
      redirect_to match_path(@match)
    else
      render :new, status: :unprocessable_entity
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
    params.require(:user_id, :hero_id, :map_id, :win)
  end

  def set_match
    @match = Match.find(params[:id])
  end
end
