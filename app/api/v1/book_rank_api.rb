require 'grape-swagger'

module V1
  class BookRankApi < Grape::API
    format :json
    helpers SessionHelper

    before do
      authenticate_user!
    end

    resource :bookranks do
      desc 'Get Book Rank'
      get do
        BookRankService.get_book_rank
      end

      desc 'Create Book Rank'
      post do
        BookRankService.create_book_rank
      end
    end
  end
end
