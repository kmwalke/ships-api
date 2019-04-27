class NewtonWorker
  include Sidekiq::Worker

  def perform(*_args)
    Satellite.all.each(&:update_pos_and_vel)
  end
end
