# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  release     :datetime
#  view        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
  has_many  :review, dependent: :destroy
  has_many  :rank, dependent: :destroy
  has_many  :bookrank, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :view, presence: true
  validates :release, presence: true
end
