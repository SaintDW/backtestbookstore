class Review < ApplicationRecord
  belongs_to :book

  validates :comment, presence: true
  validates :star, presence: true
end
