class HomeController < ApplicationController
  def index
    @satellites = Satellite.all.order(:id)
  end
end
