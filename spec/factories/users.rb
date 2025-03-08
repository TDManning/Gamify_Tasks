FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 'password123' }
    points { 0 }
    theme { association :theme }
    avatar { association :reward, reward_type: 'avatar' }
  end
end
