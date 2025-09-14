class Api::V1::BaseController < ActionController::API

  protected

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header

    begin
      decoded = JWT.decode(header, Rails.application.credentials.secret_key_base)
      @current_user = User.find(decoded[0]['user_id'])
    rescue JWT::DecodeError => e
      render json: { success: false, message: 'Invalid token' }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound => e
      render json: { success: false, message: 'User not found' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end

  def require_authentication
    authenticate_user
  end

end
