require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe 'relationships' do
    it { should have_many(:user_rewards).dependent(:destroy) }
    it { should have_many(:users).through(:user_rewards) }
  end

  describe 'validations' do
    subject { create(:reward) } 

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:points_required) }
    it { should validate_presence_of(:reward_type) }
    it { should validate_inclusion_of(:reward_type).in_array(Reward::VALID_REWARD_TYPES) }
  end

  describe 'default values' do
    it 'should have a default active status of false when not specified' do
      reward = Reward.create!(name: 'New Reward', points_required: 100, reward_type: 'game')
      expect(reward.active).to be false
    end
  end
end