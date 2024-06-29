FactoryBot.define do
  factory :review do
    comment { 'comment' }
    star { 5 }
    book_id { association(:book).id }
  end
end
