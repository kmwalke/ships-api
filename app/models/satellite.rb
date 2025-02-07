class Satellite < ApplicationRecord

  def move(delta_t)
    self.update(
      position_x: (Math.cos(radians(orientation))*delta_t).round + position_x,
      position_y: (Math.sin(radians(orientation))*delta_t).round + position_y
    )
  end

  private

  def radians(degrees)
    Math::PI / 180 * degrees
  end
end


