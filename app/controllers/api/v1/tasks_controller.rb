class Api::V1::TasksController < ApplicationController
  before_action :authorize_request

  def index
    tasks = Task.by_user(@current_user)
    render json: TaskSerializer.new(tasks).serializable_hash, status: :ok
  end

  private

  def authorize_request
    token = request.headers['Authorization']&.split(' ')&.last
    decoded = AuthService.decode(token)

    if decoded
      @current_user = User.find_by(id: decoded[:user_id])
      render_unauthorized unless @current_user
    else
      render_unauthorized
    end
  end

  def render_unauthorized
    render json: ErrorMessageSerializer.serialize('Not Authorized', 401), status: :unauthorized
  end
end
