Rails.application.routes.draw do
  mount V1::Api => '/v1'
end
