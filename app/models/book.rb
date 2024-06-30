# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  release     :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
  has_many  :review, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :release, presence: true
end
