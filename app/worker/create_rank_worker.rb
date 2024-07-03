class CreateRankWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'critical'

  def perform
    RankService.create_rank
  end
end
