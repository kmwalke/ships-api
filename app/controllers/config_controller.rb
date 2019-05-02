class ConfigController < ApplicationController
  before_action :require_json
  before_action :require_login

  def index
    render json: {
      updateFrequency: 60,
      updateFrequencyUnits: 'sec'
    }
  end
end
