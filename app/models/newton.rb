class Newton < ApplicationRecord
  def self.init
    return unless Newton.first.nil?

    Newton.create(last_updated: Time.now)
  end

  # TODO: Make transactional (failure should rollback previous updates)
  def self.iterate
    newton = Newton.first

    return if newton&.last_updated.nil?

    current_time = Time.now
    delta_t = current_time - newton.last_updated

    Satellite.all.each do |s|
      s.move(delta_t)
    end

    newton.update(last_updated: current_time)

  end
end
