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
class Review < ApplicationRecord
  belongs_to :book

  validates :comment, presence: true
  validates :star, presence: true
end
