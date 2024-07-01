require 'grape-swagger'

module V1
  class SessionApi < Grape::API
    format :json

    resource :sessions do
      desc 'Create a new session (login)'
      params do
        requires :email, type: String, desc: 'User email'
        requires :password, type: String, desc: 'User password'
      end

      post do
        user = User.find_for_database_authentication(email: params[:email])
        if user && user.valid_password?(params[:password])

          { message: 'Logged in successfully', user: }
        else
          error!('Unauthorized', 401)
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
