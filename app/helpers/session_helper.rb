module SessionHelper
  def authenticate_user!
    error!('401 Unauthorized SessionHelper', 401) unless current_user
  end

  def current_user
    token = headers['Authorization']&.split(' ')&.last
    return nil unless token

    decoded_token = JWT.decode token, nil, false
    user_id = decoded_token[0]['sub']
    @current_user ||= User.find(user_id)
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    nil
  end
end
