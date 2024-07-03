require 'grape-swagger'

module V1
  class ReviewApi < Grape::API
    format :json
    helpers SessionHelper

    before do
      authenticate_user!
    end

    resource :books do
      route_param :book_id do
        resource :reviews do
          desc 'Create Review'
          params do
            requires :comment, type: String, desc: 'Review Comment'
            requires :star, type: Integer, desc: 'Review Star'
          end
          post do
            ReviewService.create_review(params[:book_id], params[:comment], params[:star])
          end
        end
      end

      route_param :book_id do
        resource :reviews do
          desc 'Update Review'
          params do
            requires :comment, type: String, desc: 'Review Comment'
            requires :star, type: Integer, desc: 'Review Star'
          end
          put ':review_id' do
            ReviewService.update_review(params[:book_id], params[:review_id], params[:comment], params[:star])
          end
        end

        resource :reviews do
          desc 'Delete Review'
          delete ':review_id' do
            ReviewService.delete_review(params[:book_id], params[:review_id])
          end
        end
      end
    end
  end
end
