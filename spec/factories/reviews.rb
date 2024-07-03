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
FactoryBot.define do
  factory :review do
    comment { 'comment' }
    star { 5 }
    book_id { association(:book).id }
  end
end
