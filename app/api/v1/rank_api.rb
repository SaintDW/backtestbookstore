require 'grape-swagger'

module V1
  class RankApi < Grape::API
    format :json
    helpers SessionHelper

    before do
      authenticate_user!
    end

    resource :ranks do
      desc 'Get Rank'
      get do
        RankService.get_rank
      end

      desc 'Create Rank'
      post do
        RankService.create_rank
      end
    end
  end
end
