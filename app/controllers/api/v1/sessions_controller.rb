# class Api::V1::SessionsController < ApplicationController
#   def create
#     user = User.find_by(email: params[:email])

#     if user && user.authenticate(params[:password])
#       token = AuthService.encode({ user_id: user.id })
#       render json: { token: token, user: user }, status: :ok
#     else
#       render json: { error: 'Invalid email or password' }, status: :unauthorized
#     end
#   end
# end

module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authorize_request, only: [:create]

      def create
        Rails.logger.debug "Params received: #{params.inspect}"
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          Rails.logger.debug "Authentication successful"
          token = AuthService.encode(user_id: user.id)
          render json: { token: token, user: user }, status: :ok
        else
          Rails.logger.debug "Authentication failed"
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
    end
  end
end
