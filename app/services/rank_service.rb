class RankService
  def self.get_rank(date)
    Rank.where(date:).all
  end

  def self.create_rank
    date_time = Date.current
    book = Book.all.order(view: :desc)
    book.each_with_index do |book, index|
      book.rank.create!(date: date_time, view: book.view, order: index + 1, book_id: book.id)
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
