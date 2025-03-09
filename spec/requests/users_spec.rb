require 'rails_helper'

RSpec.describe "Users API", type: :request do
  let!(:user) { create(:user) }

  describe "GET /api/v1/users" do
  end

  describe "POST /api/v1/users" do
    let(:valid_attributes) do
      attributes_for(:user)
    end
  end

  describe "PATCH /api/v1/users/:id" do
  end

  describe "DELETE /api/v1/users/:id" do
  end
end
