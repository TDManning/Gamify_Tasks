require 'rails_helper'

RSpec.describe ErrorSerializer do
  describe '.serialize' do
    let(:errors) { ["Username can't be blank", "Email is invalid"] }

    it 'formats the errors as a JSON object' do
      serialized = ErrorSerializer.serialize(errors, 422)

      expect(serialized[:errors]).to be_an(Array)
      error_titles = serialized[:errors].map { |e| e[:title] }
      
      expect(error_titles).to include("Username can't be blank")
      expect(error_titles).to include("Email is invalid")
      expect(serialized[:errors].first[:status]).to eq("422")
    end
  end
end
