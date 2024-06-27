require 'grape-swagger'

module V1
  class Api < Grape::API
    format :json
    resource :books do
      get do
        Book.all
      end
    end
  end
end
