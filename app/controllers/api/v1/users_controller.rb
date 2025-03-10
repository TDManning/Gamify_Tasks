module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorize_request, only: [:create]

      def create
        user = User.new(user_params)
        if user.save
          token = AuthService.encode(user_id: user.id)
          render json: {
            data: UserSerializer.new(user).serializable_hash[:data],
            token: token
          }, status: :created
        else
          render json: ErrorSerializer.serialize(user.errors.full_messages, 422), status: :unprocessable_entity
        end
      end
      

      def show
        render json: UserSerializer.new(current_user).serializable_hash, status: :ok
      end

      private

      def user_params
        params.permit(:username, :email, :password, :password_confirmation)
      end
    end
  end
end
