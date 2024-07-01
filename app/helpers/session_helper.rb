module SessionHelper
  def authenticate_user!
    error!('401 Unauthorized', 401) unless current_user
  end

  def current_user
    token = headers['Authorization']&.split(' ')&.last
    return nil unless token

    begin
      decoded_token = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key, true, algorithm: 'HS256')
      user_id = decoded_token[0]['sub']
      @current_user ||= User.find(user_id)
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      nil
    end
  end
end
