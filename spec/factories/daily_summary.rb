FactoryBot.define do
  factory :daily_summary do
    boat
    trip
    course

    time_on_sails { Faker::Number.number(digits: 5) }
    time_on_engine { Faker::Number.number(digits: 4) }
  end
end
