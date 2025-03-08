FactoryBot.define do
  factory :reward do
    name { Faker::Game.title }
    description { Faker::Lorem.sentence }
    points_required { Faker::Number.between(from: 10, to: 1000) }
    reward_type { Reward::VALID_REWARD_TYPES.sample }
    active { true }
  end
end
