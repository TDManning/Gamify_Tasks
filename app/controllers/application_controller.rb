class ApplicationController < ActionController::API
  before_action :authorize_request

  def authorize_request
    header = request.headers['Authorization']
    if header.present?
      token = header.split(' ').last
      decoded = AuthService.decode(token)
      @current_user = User.find(decoded[:user_id]) if decoded
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    render json: { error: 'Invalid token' }, status: :unauthorized
  end

  def current_user
    @current_user
  end
end
