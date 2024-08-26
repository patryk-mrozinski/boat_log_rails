FactoryBot.define do
  factory :log_entry do
    boat
    trip
    course

    course_angle { Faker::Number.number(digits: 2) }
    boat_speed { Faker::Number.decimal(l_digits: 2) }
    see_condition { Faker::Number.between(from: 0, to: 9) }
  end
end
