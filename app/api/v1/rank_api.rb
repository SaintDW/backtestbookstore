require 'grape-swagger'

module V1
  class RankApi < Grape::API
    format :json
    helpers SessionHelper

    before do
      authenticate_user!
    end

    resource :ranks do
      desc 'Get Rank By Date'
      params do
        requires :date, type: DateTime, desc: 'Date To View Rank'
      end
      post do
        RankService.get_rank(params[:date])
      end

      desc 'Create Rank'
      get do
        RankService.create_rank
      end
    end
  end
end
