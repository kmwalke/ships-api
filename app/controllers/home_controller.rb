class HomeController < ApplicationController
  def index
    @satellites = Satellite.order(:id)
    @ship       = Satellite.last
  end
end
