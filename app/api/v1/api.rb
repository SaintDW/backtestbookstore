require 'grape-swagger'

module V1
  class Api < Grape::API
    format :json
    resource :books do
      desc 'Get all'
      get do
        Book.all
      end

      desc 'Get by id'
      params do
        requires :id, type: Integer, desc: 'Book ID'
      end
      route_param :id do
        get do
          Book.find(params[:id])
        end
      end

      desc 'Create Book'
      params do
        requires :name, type: String, desc: 'Book Name'
        requires :description, type: String, desc: 'Book Description'
        requires :release, type: DateTime, desc: 'Book Release'
      end
      post do
        user = Book.create({
                             name: params[:name],
                             description: params[:description],
                              release: params[:release]
                           })
        present user
      end
    end
  end
end
