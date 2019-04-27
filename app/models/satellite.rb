class Satellite < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  attribute :pos_x, default: 0
  attribute :pos_y, default: 0
  attribute :pos_z, default: 0
  attribute :vel_x, default: 0
  attribute :vel_y, default: 0
  attribute :vel_z, default: 0
  attribute :thrust_x, default: 0
  attribute :thrust_y, default: 0
  attribute :thrust_z, default: 0
  attribute :last_updated, default: Time.zone.now

  def update_pos_and_vel
    now = Time.zone.now

    self.vel_x += calc_delta(now, thrust_x)
    self.vel_y += calc_delta(now, thrust_y)
    self.vel_z += calc_delta(now, thrust_z)
    self.pos_x += calc_delta(now, vel_x)
    self.pos_y += calc_delta(now, vel_y)
    self.pos_z += calc_delta(now, vel_z)

    self.last_updated = now

    save
  end

  def pos_unie
    'm'
  end

  def vel_unit
    'm/s'
  end

  def thrust_unit
    'm/s/s'
  end

  private

  def calc_delta(now, vel)
    return vel unless last_updated

    time = last_updated
    time = Time.zone.parse time if time.is_a?(String)

    (now - time).to_i * vel
  end
end
