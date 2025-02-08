class HomeController < ApplicationController
  def index
    @satellites = Satellite.order(:id)
  end
end
