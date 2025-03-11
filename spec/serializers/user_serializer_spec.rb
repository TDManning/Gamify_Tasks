require 'rails_helper'

RSpec.describe UserSerializer do
  let(:user) { create(:user) }

  it 'serializes the user attributes' do
    serialized = described_class.new(user).serializable_hash[:data][:attributes]

    expect(serialized[:email]).to eq(user.email)
    expect(serialized[:username]).to eq(user.username)
    expect(serialized[:created_at]).to eq(user.created_at.iso8601)
    expect(serialized[:updated_at]).to eq(user.updated_at.iso8601)
  end
end
