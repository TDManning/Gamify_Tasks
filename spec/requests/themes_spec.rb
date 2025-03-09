require 'rails_helper'

RSpec.describe "Themes API", type: :request do
  let!(:theme) { create(:theme) }

  let(:valid_attributes) do
    attributes_for(:theme)
  end

  describe "GET /api/v1/themes" do
  end

  describe "POST /api/v1/themes" do
  end

  describe "PATCH /api/v1/themes/:id" do
  end

  describe "DELETE /api/v1/themes/:id" do
  end
end
