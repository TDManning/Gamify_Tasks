class Reward < ApplicationRecord
  has_many :user_rewards, dependent: :destroy
  has_many :users, through: :user_rewards
  VALID_REWARD_TYPES = ['game', 'avatar', 'theme']

  validates :name, presence: true
  validates :points_required, presence: true
  validates :reward_type, presence: true, inclusion: { in: VALID_REWARD_TYPES }
end
