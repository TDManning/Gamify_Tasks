require 'rails_helper'

RSpec.describe 'User Requests', type: :request do
  let!(:user) do
    User.create(
      email: 'test@example.com',
      username: 'TestUser',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  def auth_headers(user)
    token = AuthService.encode(user_id: user.id)
    { 'Authorization' => "Bearer #{token}" }
  end

  describe 'POST /api/v1/users' do
    context 'with valid data' do
      it 'creates a new user and returns a token' do
        post '/api/v1/users', params: {
          username: 'newuser',
          email: 'new@example.com',
          password: 'password123',
          password_confirmation: 'password123'
        }
  
        expect(response).to have_http_status(:created)
  
        body = JSON.parse(response.body)
        expect(body['data']['attributes']['email']).to eq('new@example.com')
        expect(body['token']).to be_present
      end
    end
  end
  
  context 'with invalid data' do
    it 'returns an error' do
      post '/api/v1/users', params: {
        username: '',
        email: '',
        password: 'password123',
        password_confirmation: 'wrongpassword'
      }
  
      expect(response).to have_http_status(:unprocessable_entity)
  
      body = JSON.parse(response.body)
      errors = body['errors'].map { |e| e['title'] }
  
      expect(errors).to include(
        "Email can't be blank",
        "Username can't be blank",
        "Password confirmation doesn't match Password"
      )
    end
  end  

  describe 'GET /api/v1/users/profile' do
    context 'when authorized' do
      it 'returns the user profile' do
        get '/api/v1/users/profile', headers: auth_headers(user)

        expect(response).to have_http_status(:ok)

        body = JSON.parse(response.body)
        expect(body['data']['attributes']['email']).to eq(user.email)
      end
    end

    context 'when unauthorized' do
      it 'returns unauthorized error' do
        get '/api/v1/users/profile'

        expect(response).to have_http_status(:unauthorized)

        body = JSON.parse(response.body)
        expect(body['errors'][0]['title']).to eq('Not authorized')
      end
    end
  end
end
