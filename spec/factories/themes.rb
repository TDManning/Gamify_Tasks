FactoryBot.define do
  factory :theme do
    name { Faker::Color.color_name }
    description { Faker::Lorem.sentence }
    css_class { Faker::Lorem.word }
  end
end
