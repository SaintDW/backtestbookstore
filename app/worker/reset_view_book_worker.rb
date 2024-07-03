class ResetViewBookWorker
  include Sidekiq::Worker

  def perform
    Book.reset_view_book
  end
end
