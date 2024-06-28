class Book < ApplicationRecord
  has_many  :review

  validates :name, presence: true
  validates :description, presence: true
  validates :release, presence: true
end
