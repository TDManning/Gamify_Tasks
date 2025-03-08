FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
    password { "password" }
    password_confirmation { "password" }
    points { 0 }
    theme { association :theme }
    avatar { association :reward, reward_type: 'avatar' }
  end
end
