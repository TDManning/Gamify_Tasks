class UserReward < ApplicationRecord
  belongs_to :user
  belongs_to :reward

  validates :user, presence: true
  validates :reward, presence: true
end
