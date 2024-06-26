Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
end
