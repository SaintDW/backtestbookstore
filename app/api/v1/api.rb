require 'grape-swagger'

module V1
  class Api < Grape::API
    mount V1::BookApi
    mount V1::ReviewApi
    mount V1::SessionApi
    mount V1::RankApi
    mount V1::BookRankApi
  end
end
