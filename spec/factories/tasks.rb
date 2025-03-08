FactoryBot.define do
  factory :task do
    user
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    points_awarded { Faker::Number.between(from: 0, to: 100) }
    completed { false }
    due_date { Faker::Date.forward(days: 14) }
    priority { Task::VALID_PRIORITIES.sample }
    status { Task::VALID_STATUSES.sample }
  end
end
