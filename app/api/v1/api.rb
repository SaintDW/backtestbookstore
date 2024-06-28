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
        Book.create({
                      name: params[:name],
                      description: params[:description],
                      release: params[:release]
                    })
      end

      desc 'Update Book'
      params do
        requires :name, type: String, desc: 'Book Name'
        requires :description, type: String, desc: 'Book Description'
        requires :release, type: DateTime, desc: 'Book Release'
      end
      put ':id' do
        Book.find(params[:id]).update({
                                        name: params[:name],
                                        description: params[:description],
                                        release: params[:release]
                                      })
      end

      desc 'Delete Book'
      delete ':id' do
        Book.find(params[:id]).destroy
      end
    end
  end
end
