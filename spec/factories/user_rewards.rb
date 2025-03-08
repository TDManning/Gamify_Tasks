FactoryBot.define do
  factory :user_reward do
    user
    reward
    purchased { true }
    unlocked { false }
  end
end
