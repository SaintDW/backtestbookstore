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
FactoryBot.define do
    factory :book do
        name { "name" }
        description { "description" }
        release { "2024-06-26 12:34:56.000" }
    end
end
