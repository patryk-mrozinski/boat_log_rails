FactoryBot.define do
  factory :watch do
    boat
    trip
    course

    start_time { Faker::Time.backward(days: 14, period: :evening) }
  end
end
