class SatellitesController < ApplicationController
  before_action :set_satellite, only: [:show, :update, :destroy]

  # GET /satellites
  # GET /satellites.json
  def index
    @satellites = Satellite.all
  end

  # GET /satellites/1
  # GET /satellites/1.json
  def show
  end

  # POST /satellites
  # POST /satellites.json
  def create
    @satellite = Satellite.new(satellite_params)

    if @satellite.save
      render :show, status: :created, location: @satellite
    else
      render json: @satellite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /satellites/1
  # PATCH/PUT /satellites/1.json
  def update
    if @satellite.update(satellite_params)
      render :show, status: :ok, location: @satellite
    else
      render json: @satellite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /satellites/1
  # DELETE /satellites/1.json
  def destroy
    @satellite.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_satellite
      @satellite = Satellite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def satellite_params
      params.require(:satellite).permit(:name, :x_pos, :y_pos, :z_pos, :x_vel, :y_vel, :z_vel, :last_updated)
    end
end
