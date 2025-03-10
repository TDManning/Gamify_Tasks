class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from JWT::DecodeError, with: :render_unauthorized

  before_action :authorize_request

  private

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    if token.present?
      decoded = AuthService.decode(token)
      @current_user = User.find(decoded[:user_id]) if decoded
    end
  
    render_unauthorized unless @current_user
  rescue ActiveRecord::RecordNotFound
    render_unauthorized
  rescue JWT::DecodeError
    render_unauthorized
  end

  def current_user
    @current_user
  end

  def render_unauthorized
    render json: ErrorSerializer.serialize(['Not authorized'], 401), status: :unauthorized
  end

  def render_not_found
    render json: ErrorSerializer.serialize(['Not found'], 404), status: :not_found
  end
end
