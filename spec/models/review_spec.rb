# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  comment    :string
#  star       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#
# Indexes
#
#  index_reviews_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
require 'rails_helper'

RSpec.describe 'Review', type: :model do
  # describe 'validation review' do
  #   describe ':review' do
  #     subject(:factory) { create(:review) }

  #     it { is_expected.to be_valid }
  #   end
  # end

  describe 'callbacks review' do
    it 'get all review' do
      book = create(:book)
      review = create(:review, book_id: book.id)
      review = create(:review, book_id: book.id)
      expect(Review.count).to be >= 1
    end

    it 'get by id review' do
      book = create(:book)
      review = create(:review, book_id: book.id)
      found_review = Review.find_by(id: review.id)
      expect(found_review).to eq(review)
    end

    it 'create review' do
      book = create(:book)
      review = create(:review, book_id: book.id)
      expect(review.comment).to eq(review.comment)
      expect(review.star).to eq(review.star)
      expect(review.book_id).to eq(review.book_id)
    end

    it 'update review' do
      book = create(:book)
      review = create(:review, book_id: book.id)
      review.update(comment: 'commenttest', star: 0)
      expect(review.comment).to eq('commenttest')
      expect(review.star).to eq(0)
    end

    it 'deletes review' do
      book = create(:book)
      review = create(:review, book_id: book.id)
      review.destroy
      expect(Review.find_by(id: review.id)).to be_nil
    end
  end

  #   describe 'associations book' do
  #   end

  #   describe 'scopes book' do
  #   end

  #   describe 'methods book' do
  #   end
end
