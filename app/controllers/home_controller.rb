class HomeController < ApplicationController
  def index
    @satellites = Satellite.all
  end
end
