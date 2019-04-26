class NewtonWorker
  include Sidekiq::Worker

  def perform(*_args)
    Satellite.all.each(&:update_position)
  end
end
