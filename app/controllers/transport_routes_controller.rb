class TransportRoutesController < ApplicationController
  # GET /transport_routes
  # GET /transport_routes.json
  def index
    @transport_routes = TransportRoute.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transport_routes }
    end
  end

  # GET /transport_routes/1
  # GET /transport_routes/1.json
  def show
    @transport_route = TransportRoute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transport_route }
    end
  end

  # GET /transport_routes/new
  # GET /transport_routes/new.json
  def new
    @transport_route = TransportRoute.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transport_route }
    end
  end

  # GET /transport_routes/1/edit
  def edit
    @transport_route = TransportRoute.find(params[:id])
  end

  # POST /transport_routes
  # POST /transport_routes.json
  def create
    @transport_route = TransportRoute.new(params[:transport_route])

    respond_to do |format|
      if @transport_route.save
        format.html { redirect_to @transport_route, notice: 'Transport route was successfully created.' }
        format.json { render json: @transport_route, status: :created, location: @transport_route }
      else
        format.html { render action: "new" }
        format.json { render json: @transport_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transport_routes/1
  # PUT /transport_routes/1.json
  def update
    @transport_route = TransportRoute.find(params[:id])

    respond_to do |format|
      if @transport_route.update_attributes(params[:transport_route])
        format.html { redirect_to @transport_route, notice: 'Transport route was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transport_route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transport_routes/1
  # DELETE /transport_routes/1.json
  def destroy
    @transport_route = TransportRoute.find(params[:id])
    @transport_route.destroy

    respond_to do |format|
      format.html { redirect_to transport_routes_url }
      format.json { head :no_content }
    end
  end
end
