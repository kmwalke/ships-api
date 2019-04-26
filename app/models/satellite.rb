class Satellite < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  attribute :pos_x, default: 0
  attribute :pos_y, default: 0
  attribute :pos_z, default: 0
  attribute :vel_x, default: 0
  attribute :vel_y, default: 0
  attribute :vel_z, default: 0
  attribute :last_updated, default: Time.zone.now

  def update_position
    now = Time.zone.now

    self.pos_x += calc_position(now, vel_x)
    self.pos_y += calc_position(now, vel_y)
    self.pos_z += calc_position(now, vel_z)

    self.last_updated = now

    save
  end

  private

  def calc_position(now, vel)
    return vel unless last_updated

    value = last_updated
    value = Time.zone.parse value if value.is_a?(String)

    (now - value).to_i * vel
  end
end
