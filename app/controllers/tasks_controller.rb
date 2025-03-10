class Api::V1::TasksController < ApplicationController
  before_action :authorize_request

  def index
    tasks = current_user.tasks
    render json: tasks
  end
end
