module ApplicationHelper
  def pretty_position(satellite)
    "#{satellite.position_x}, #{satellite.position_y}"
  end

  def pretty_velocity(satellite)
    "#{scalar_velocity(satellite.velocity_x, satellite.velocity_y)} m/s"
  end

  def scalar_velocity(vel_x, vel_y)
    Math.sqrt((vel_x * vel_x) + (vel_y * vel_y)).round
  end
end
