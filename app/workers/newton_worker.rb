class NewtonWorker
  include Sidekiq::Worker

  def perform(*args)
    logger.info 'WORKER RUNNING'

    Satellite.all.each do |s|
      s.update_position
    end
  end
end
