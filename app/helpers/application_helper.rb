module ApplicationHelper

  def pretty_position(satellite)
    "#{satellite.position_x}, #{satellite.position_y}"
  end

  def pretty_velocity(satellite)
    "#{satellite.velocity_x}, #{satellite.velocity_y}"
  end
end
