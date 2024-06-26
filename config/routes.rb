Rails.application.routes.draw do
  # get 'up' => 'rails/health#show', as: :rails_health_check

  # root 'books#index'
  # resources :books

  # get '/books', to: 'books#index'
  # get '/books/:id', to: 'books#show'
  # post '/books', to: 'books#new'

  mount ::V1::API => '/api/v1'
end
