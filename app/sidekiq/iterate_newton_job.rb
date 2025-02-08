class IterateNewtonJob
  include Sidekiq::Job

  def perform(*_args)
    Newton.iterate
  end
end
