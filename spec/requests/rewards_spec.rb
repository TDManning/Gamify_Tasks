require 'rails_helper'

RSpec.describe "Rewards API", type: :request do
  let!(:reward) { create(:reward) }

  let(:valid_attributes) do
    attributes_for(:reward)
  end

  describe "GET /api/v1/rewards" do
  end

  describe "POST /api/v1/rewards" do
  end

  describe "PATCH /api/v1/rewards/:id" do
  end

  describe "DELETE /api/v1/rewards/:id" do
  end
end
