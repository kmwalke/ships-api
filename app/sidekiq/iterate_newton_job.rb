class IterateNewtonJob
  include Sidekiq::Job

  def perform(*args)
    Newton.iterate
  end
end
