FactoryBot.define do
  factory :course do
    boat
    trip

    departure_time { Faker::Time.backward(days: 14, period: :evening) }
    departure_location { Faker::Address.city }
  end
end
