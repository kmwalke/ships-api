class Satellite < ApplicationRecord

  private

  def position_x=(v)
    self.position_x=v
  end

  def position_y=(v)
    self.position_y=v
  end

  def velocity=(v)
    self.velocity=v
  end
end
