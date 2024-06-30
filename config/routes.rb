Rails.application.routes.draw do
  devise_for :users
  mount V1::Api => '/v1'
end
