require 'rails_helper'

RSpec.describe UserService do
  describe '.create_user' do
    let(:valid_params) do
      {
        username: 'testuser',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
    end

    let(:invalid_params) do
      {
        username: '',
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
    end

    context 'when the params are valid' do
      it 'creates a user and returns a token' do
        result = UserService.create_user(valid_params)

        expect(result.success?).to be true
        expect(result.user).to be_persisted
        expect(result.token).to be_present
      end
    end

    context 'when the params are invalid' do
      it 'returns an error and does not create a user' do
        result = UserService.create_user(invalid_params)

        expect(result.success?).to be false
        expect(result.user).to be_nil
        expect(result.token).to be_nil
        expect(result.errors).to include("Username can't be blank")
      end
    end
  end
end
