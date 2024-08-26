def create_user
  @user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

def create_boat
  @boat = Boat.create!(
    owner: @user,

    length: Faker::Number.decimal(l_digits: 2),
    width: Faker::Number.decimal(l_digits: 2),
    max_draft: Faker::Number.decimal(l_digits: 2),
    type_name: Faker::Name.name,
    home_port: Faker::Address.city,
    name: Faker::Name.name,
    registration: Faker::Lorem.characters(number: 8)
  )
end

def create_trip
  @trip = Trip.create!(
    boat: @boat,

    departure_time: Faker::Time.backward(days: 14, period: :evening),
    departure_location: Faker::Address.city
  )
end

def create_course
  @course = Course.create!(
    boat: @boat,
    trip: @trip,

    departure_time: Faker::Time.backward(days: 14, period: :evening),
    departure_location: Faker::Address.city
  )
end

def create_daily_summary
  DailySummary.create!(
    boat: @boat,
    trip: @trip,
    course: @course,

    time_on_sails: Faker::Number.number(digits: 5),
    time_on_engine: Faker::Number.number(digits: 4)
  )
end

def create_log_entry
  10.times do
    LogEntry.create!(
      boat: @boat,
      trip: @trip,
      course: @course,

      course_angle: Faker::Number.number(digits: 2),
      boat_speed: Faker::Number.decimal(l_digits: 2),
      see_condition: Faker::Number.between(from: 0, to: 9)
    )
  end
end

def create_watch
  2.times do
    Watch.create!(
      boat: @boat,
      trip: @trip,
      course: @course,

      start_time: Faker::Time.backward(days: 14, period: :evening)
    )
  end
end

def create_engine
  Engine.create!(
    boat: @boat,

    power: Faker::Number.number(digits: 2),
    type_name: Engine.type_names.to_a.sample.first,
    brand: Faker::Company.name
  )
end

def create_sail
  Sail.create!(
    boat: @boat,

    type_name: Sail.type_names.to_a.sample.first,
    area: Faker::Number.decimal(l_digits: 2)
  )
end

ActiveRecord::Base.transaction do
  create_user

  create_boat
  create_trip
  create_course
  create_daily_summary
  create_log_entry
  create_watch
  create_engine
  create_sail

  puts 'Seeding done'
end
