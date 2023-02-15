class MapsController < ApplicationController
  before_action :set_map, only: %i[show]
  def index
    @maps = Map.all
  end

  def create
    @map = Map.new(params)
    @map.save
  end

  private

  def map_params
    params.require(:name, :type, :win_rate)
  end

  def set_map
    @map = Map.find(params[:id])
  end
end
