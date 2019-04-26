class Satellite < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  attribute :pos_x, default: 0
  attribute :pos_y, default: 0
  attribute :pos_z, default: 0
  attribute :vel_x, default: 0
  attribute :vel_y, default: 0
  attribute :vel_z, default: 0
end
