require 'rails_helper'

RSpec.describe "UserRewards API", type: :request do
  let!(:user) { create(:user) }
  let!(:reward) { create(:reward) }
  let!(:user_reward) { create(:user_reward, user: user, reward: reward) }

  let(:valid_attributes) do
    {
      user_id: user.id,
      reward_id: reward.id,
      purchased: true,
      unlocked: false
    }
  end

  describe "GET /api/v1/user_rewards" do
  end

  describe "POST /api/v1/user_rewards" do
  end

  describe "PATCH /api/v1/user_rewards/:id" do
  end

  describe "DELETE /api/v1/user_rewards/:id" do
  end
end
