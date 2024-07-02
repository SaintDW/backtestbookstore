require 'grape-swagger'

module V1
  class SessionApi < Grape::API
    format :json

    helpers do
      def generate_token(user)
        JWT.encode({ sub: user.id, exp: 24.hours.from_now.to_i }, Rails.application.credentials.devise_jwt_secret_key,
                   'HS256')
      end
    end

    resource :sessions do
      desc 'Create a new session (login)'
      params do
        requires :email, type: String, desc: 'User email'
        requires :password, type: String, desc: 'User password'
      end

      post do
        user = User.find_for_database_authentication(email: params[:email])
        if user && user.valid_password?(params[:password])
          token = generate_token(user)
          { message: 'Logged in successfully', user:, token: }
        else
          error!('Unauthorized SessionApi', 401)
        end
      end

      desc 'Destroy the current session (logout)'
      delete do
        authenticate_user! # Ensure authenticated user
        sign_out(current_user)
        { message: 'Logged out successfully' }
      end
    end
  end
end
