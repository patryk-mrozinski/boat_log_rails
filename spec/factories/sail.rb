FactoryBot.define do
  factory :sail do
    boat

    type_name { Sail.type_names.to_a.sample.first }
    area { Faker::Number.decimal(l_digits: 2) }
  end
end
