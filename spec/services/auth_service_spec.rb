require 'rails_helper'

RSpec.describe AuthService do
  describe '.encode' do
    let(:payload) { { user_id: 1 } }

    it 'returns a JWT token' do
      token = AuthService.encode(payload)
      expect(token).to be_a(String)
    end
  end

  describe '.decode' do
    let(:payload) { { user_id: 1 } }
    let(:token) { AuthService.encode(payload) }

    it 'decodes the token correctly' do
      decoded = AuthService.decode(token)
      expect(decoded['user_id']).to eq(1)
    end
  end
end
