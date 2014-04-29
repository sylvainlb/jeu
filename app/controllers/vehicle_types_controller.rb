class VehicleTypesController < ApplicationController
  def index
    @vehicle_types=Vehicles::VEHICLES

    respond_to do |format|
      format.json { render json: @vehicle_types }
    end

  end

  def show

  end
end