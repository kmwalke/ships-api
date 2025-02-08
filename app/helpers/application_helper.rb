module ApplicationHelper

  def pretty_position(satellite)
    "#{satellite.position_x}, #{satellite.position_y}"
  end

  def pretty_velocity(satellite)
    "#{scalar_velocity(satellite.velocity_x, satellite.velocity_y)} m/s"
  end

  def scalar_velocity(x, y)
    Math.sqrt(x*x + y*y).round
  end
end
