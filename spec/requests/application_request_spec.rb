require 'rails_helper'

RSpec.describe 'Application Controller', type: :request do
  let!(:user) { create(:user) }
  let(:token) { AuthService.encode(user_id: user.id) }

  before do
    Rails.application.routes.draw do
      get 'test_current_user', to: 'application#test_current_user'
    end

    ApplicationController.class_eval do
      def test_current_user
        if current_user
          render json: { message: "Authorized as #{current_user.email}" }
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
      end
    end
  end

  after do
    Rails.application.reload_routes!
  end

  describe 'GET /test_current_user' do
    context 'when user is authorized' do
      it 'returns the current user' do
        get '/test_current_user', headers: { 'Authorization' => "Bearer #{token}" }

        expect(response).to have_http_status(:ok)
        body = JSON.parse(response.body)
        expect(body['message']).to eq("Authorized as #{user.email}")
      end
    end

    context 'when user is unauthorized' do
      it 'returns a 401 unauthorized error' do
        get '/test_current_user' 
    
        expect(response).to have_http_status(:unauthorized)
        body = JSON.parse(response.body)
    
        expect(body['errors'][0]['title']).to eq("Not authorized")
      end
    end
  end
end
