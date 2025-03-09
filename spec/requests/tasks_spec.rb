require 'rails_helper'

RSpec.describe "Tasks API", type: :request do
  let!(:user) { create(:user) }
  let!(:task) { create(:task, user: user) }

  let(:valid_attributes) do
    attributes_for(:task).merge(user_id: user.id)
  end

  describe "GET /api/v1/tasks" do
  end

  describe "POST /api/v1/tasks" do
  end

  describe "PATCH /api/v1/tasks/:id" do
  end

  describe "DELETE /api/v1/tasks/:id" do
  end
end
