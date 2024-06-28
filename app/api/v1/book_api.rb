require 'grape-swagger'

module V1
  class BookApi < Grape::API
    format :json
    resource :books do
      desc 'Get all'
      get do
        BookService.get_all_bookx
      end

      desc 'Get by id'
      route_param :book_id do
        get do
          BookService.get_book_by_id(params[:book_id])
        end
      end

      desc 'Create Book'
      params do
        requires :name, type: String, desc: 'Book Name'
        requires :description, type: String, desc: 'Book Description'
        requires :release, type: DateTime, desc: 'Book Release'
      end
      post do
        BookService.create_book(params[:name], params[:description], params[:release])
      end

      desc 'Update Book'
      params do
        requires :name, type: String, desc: 'Book Name'
        requires :description, type: String, desc: 'Book Description'
        requires :release, type: DateTime, desc: 'Book Release'
      end
      put ':book_id' do
        BookService.update_book(params[:book_id], params[:name], params[:description], params[:release])
      end

      desc 'Delete Book'
      delete ':book_id' do
        BookService.delete_book(params[:book_id])
      end
    end
  end
end
