FactoryBot.define do
  factory :trip do
    boat

    departure_time { Faker::Time.backward(days: 14, period: :evening) }
    departure_location { Faker::Address.city }
  end
end
