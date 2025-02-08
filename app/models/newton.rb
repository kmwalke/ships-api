class Newton < ApplicationRecord
  self::G = 9.8
  def self.init
    return unless Newton.first.nil?

    Newton.create(last_updated: Time.zone.now)
  end

  # TODO: Make transactional (failure should rollback previous updates)
  def self.iterate
    newton = Newton.first

    return if newton&.last_updated.nil?

    current_time = Time.zone.now
    delta_t      = current_time - newton.last_updated

    Satellite.find_each do |s|
      s.move(delta_t)
    end

    newton.update(last_updated: current_time)
  end
end
