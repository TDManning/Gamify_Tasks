module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authorize_request, only: [:create]

      def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          token = AuthService.encode(user_id: user.id)
          render json: {
            data: UserSerializer.new(user).serializable_hash[:data],
            token: token
          }, status: :created
        else
          render json: ErrorSerializer.serialize(['Invalid email or password'], 401), status: :unauthorized
        end
      end
    end
  end
end
