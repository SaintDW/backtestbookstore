require 'grape-swqgger'

module V1
    class API < Grape::API
        mount v1::BookAPI
    end
end