FactoryBot.define do
  factory :engine do
    boat

    power { Faker::Number.number(digits: 2) }
    type_name { Engine.type_names.to_a.sample.first }
    brand { Faker::Company.name }
  end
end
