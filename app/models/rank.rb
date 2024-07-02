# == Schema Information
#
# Table name: ranks
#
#  id         :bigint           not null, primary key
#  date       :datetime
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#
# Indexes
#
#  index_ranks_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
class Rank < ApplicationRecord
  belongs_to :book
  has_many :book_rank, dependent: :destroy
end
