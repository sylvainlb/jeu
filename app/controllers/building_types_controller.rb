class BuildingTypesController < ApplicationController
  def index
    @building_types=Buildings::BUILDINGS

    respond_to do |format|
      format.json { render json: @building_types }
    end

  end

  def show

  end
end