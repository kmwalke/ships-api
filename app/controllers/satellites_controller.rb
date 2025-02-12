class SatellitesController < ApplicationController
  before_action :set_satellite, only: [:show, :update, :destroy]

  # GET /satellites
  def index
    @satellites = Satellite.all

    render json: @satellites
  end

  # GET /satellites/1
  def show
    render json: @satellite
  end

  # POST /satellites
  def create
    @satellite = Satellite.new(satellite_params)

    if @satellite.save
      render json: @satellite, status: :created, location: @satellite
    else
      render json: @satellite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /satellites/1
  def update
    if @satellite.update(satellite_params)
      render json: @satellite
    else
      render json: @satellite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /satellites/1
  def destroy
    @satellite.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_satellite
    @satellite = Satellite.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def satellite_params
    params.expect(satellite: [:name, :thrust, :orientation])
  end
end
