require 'rails_helper'

RSpec.describe ErrorMessageSerializer do
  describe '.serialize' do
    let(:message) { "Item not found" }

    it 'formats a single error message as a JSON object' do
      serialized = ErrorMessageSerializer.serialize(message, 404)

      expect(serialized[:errors]).to be_an(Array)
      expect(serialized[:errors].first[:title]).to eq("Item not found")
      expect(serialized[:errors].first[:status]).to eq("404")
    end
  end
end
