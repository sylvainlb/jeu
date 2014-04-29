class ResourceTypesController < ApplicationController
  def index
    @resource_types=Resources::RESOURCES.map do |resname,properties|
      Hash[:id,resname].merge!(properties)
    end

    respond_to do |format|
      format.json { render json: @resource_types}
    end

  end

  def show

  end
end
