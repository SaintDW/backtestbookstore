class Book < ApplicationRecord
  has_many :review, dependent: :destroy
end
