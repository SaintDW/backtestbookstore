class RankService
  def self.create_rank(book_id, star)
    book = Book.find(book_id)
    book.review.create!({ comment:, star:, book_id: })
  end

  def self.update_review(book_id, review_id, comment, star)
    book = Book.find(book_id)
    book.review.find(review_id).update!({ comment:, star: })
  end

  def self.delete_review(book_id, review_id)
    book = Book.find(book_id)
    book.review.find(review_id).destroy
  end
end
