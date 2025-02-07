module ApplicationHelper
  def pretty_position(satellite)
    "#{satellite.position_x}, #{satellite.position_y}"
  end
end
