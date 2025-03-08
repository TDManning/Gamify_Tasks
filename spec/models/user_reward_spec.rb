require 'rails_helper'

RSpec.describe UserReward, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:reward) }
  end

  describe 'validations' do
    subject { create(:user_reward) }

    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:reward) }
  end

  describe 'default values' do
    it 'should default purchased to true' do
      user_reward = create(:user_reward)
      expect(user_reward.purchased).to be true
    end

    it 'should default unlocked to false' do
      user_reward = create(:user_reward)
      expect(user_reward.unlocked).to be false
    end
  end
end
