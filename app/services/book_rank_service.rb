class BookRankService
  def self.get_book_rank
    date_time = Date.current
    BookRank.where(date: date_time).all
  end

  def self.create_book_rank
    date_time = Date.current
    rank = Rank.where(date: date_time).all
    rank.each_with_index do |rank, _index|
      rank.book_rank.create!(book_id: rank.book.id, rank_id: rank.id, view: rank.book.view, date: date_time,
                             order_id: rank.order)
    end
  end

  # def self.update_review(book_id, review_id, comment, star)
  #   book = Book.find(book_id)
  #   book.review.find(review_id).update!({ comment:, star: })
  # end

  # def self.delete_review(book_id, review_id)
  #   book = Book.find(book_id)
  #   book.review.find(review_id).destroy
  # end
end
