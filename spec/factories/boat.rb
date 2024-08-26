FactoryBot.define do
  factory :boat do
    owner { create(:user) }

    length { Faker::Number.decimal(l_digits: 2) }
    width { Faker::Number.decimal(l_digits: 2) }
    max_draft { Faker::Number.decimal(l_digits: 2) }
    type_name { Faker::Name.name }
    home_port { Faker::Address.city }
    name { Faker::Name.name }
    registration { Faker::Lorem.characters(number: 8) }
  end
end
