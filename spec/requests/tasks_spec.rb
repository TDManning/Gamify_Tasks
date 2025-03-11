require 'rails_helper'

RSpec.describe "Tasks API", type: :request do
  let!(:user) { create(:user) }
  let!(:task) { create(:task, user: user) }
  let(:token) { AuthService.encode(user_id: user.id) }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }
  
  def json
    JSON.parse(response.body)
  end

  describe "GET /api/v1/tasks" do
    context "when user is authenticated" do
      it "returns a list of tasks" do
        get '/api/v1/tasks', headers: headers

        expect(response).to have_http_status(:ok)
        expect(json['data'].size).to eq(1)
        expect(json['data'].first['attributes']['name']).to eq(task.name)
      end
    end

    context "when token is missing" do
      it "returns a missing token error" do
        get '/api/v1/tasks'

        expect(response).to have_http_status(:unauthorized)
        expect(json['errors'].first['title']).to eq('Not Authorized')
      end
    end

    context "when token is invalid" do
      it "returns an invalid token error" do
        get '/api/v1/tasks', headers: { 'Authorization' => 'Bearer invalidtoken' }

        expect(response).to have_http_status(:unauthorized)
        expect(json['errors'].first['title']).to eq('Not Authorized')
      end
    end

    context "when token is expired" do
      let(:expired_token) { AuthService.encode({ user_id: user.id }, Time.now.to_i - 10) }
      let(:expired_headers) { { 'Authorization' => "Bearer #{expired_token}" } }

      it "returns a token expired error" do
        get '/api/v1/tasks', headers: expired_headers

        expect(response).to have_http_status(:unauthorized)
        expect(json['errors'].first['title']).to eq('Not Authorized')
      end
    end
  end
end
