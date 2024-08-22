# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_08_22_131246) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "boat_users", force: :cascade do |t|
    t.uuid "boat_id"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_boat_users_on_boat_id"
    t.index ["user_id"], name: "index_boat_users_on_user_id"
  end

  create_table "boats", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "length", null: false
    t.float "width", null: false
    t.float "max_draft", null: false
    t.string "type_name", null: false
    t.string "home_port", null: false
    t.string "name", null: false
    t.string "registration", null: false
    t.float "sails_area"
    t.float "mast_height"
    t.uuid "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_boats_on_owner_id"
  end

  create_table "courses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "departure_time", null: false
    t.string "departure_location", null: false
    t.datetime "arriving_time"
    t.string "arriving_location"
    t.string "sailing_number"
    t.string "sailing_type"
    t.string "stopover_in"
    t.text "comments"
    t.uuid "boat_id"
    t.uuid "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_courses_on_boat_id"
    t.index ["trip_id"], name: "index_courses_on_trip_id"
  end

  create_table "daily_summaries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "time_on_sails", null: false
    t.integer "time_on_engine", null: false
    t.datetime "time_position_lights_on"
    t.datetime "time_position_lights_off"
    t.integer "standstill_time"
    t.text "description"
    t.uuid "boat_id"
    t.uuid "trip_id"
    t.uuid "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_daily_summaries_on_boat_id"
    t.index ["course_id"], name: "index_daily_summaries_on_course_id"
    t.index ["trip_id"], name: "index_daily_summaries_on_trip_id"
  end

  create_table "engines", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type_name", null: false
    t.integer "power", null: false
    t.string "brand", null: false
    t.uuid "boat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_engines_on_boat_id"
  end

  create_table "log_entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "course_angle", null: false
    t.string "see_condition", null: false
    t.float "boat_speed", null: false
    t.integer "compass_heading"
    t.string "declination"
    t.string "deviation"
    t.string "wind_correction"
    t.string "sea_current_correction"
    t.string "log_indication"
    t.string "used_sails_mark"
    t.string "used_engine_information"
    t.string "wind_power"
    t.string "clouds_and_rain"
    t.integer "barometric_pressure"
    t.integer "temperature"
    t.string "visibility"
    t.uuid "boat_id"
    t.uuid "trip_id"
    t.uuid "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_log_entries_on_boat_id"
    t.index ["course_id"], name: "index_log_entries_on_course_id"
    t.index ["trip_id"], name: "index_log_entries_on_trip_id"
  end

  create_table "sails", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type_name", null: false
    t.float "area", null: false
    t.string "marks"
    t.uuid "boat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_sails_on_boat_id"
  end

  create_table "trips", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "departure_time", null: false
    t.string "departure_location", null: false
    t.datetime "arriving_time"
    t.string "arriving_location"
    t.string "estimated_arriving_location"
    t.datetime "estimated_arriving_time"
    t.string "status", default: "draft"
    t.uuid "boat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_trips_on_boat_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.citext "first_name", null: false
    t.citext "last_name", null: false
    t.citext "email", default: "", null: false
    t.string "password_digest", null: false
    t.boolean "boat_owner", default: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "last_sign_in_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "watches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "start_time", null: false
    t.datetime "end_time"
    t.string "number"
    t.uuid "boat_id"
    t.uuid "trip_id"
    t.uuid "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_id"], name: "index_watches_on_boat_id"
    t.index ["course_id"], name: "index_watches_on_course_id"
    t.index ["trip_id"], name: "index_watches_on_trip_id"
  end

  add_foreign_key "boat_users", "boats"
  add_foreign_key "boat_users", "users"
  add_foreign_key "boats", "users", column: "owner_id"
  add_foreign_key "courses", "boats"
  add_foreign_key "courses", "trips"
  add_foreign_key "daily_summaries", "boats"
  add_foreign_key "daily_summaries", "courses"
  add_foreign_key "daily_summaries", "trips"
  add_foreign_key "engines", "boats"
  add_foreign_key "log_entries", "boats"
  add_foreign_key "log_entries", "courses"
  add_foreign_key "log_entries", "trips"
  add_foreign_key "sails", "boats"
  add_foreign_key "trips", "boats"
  add_foreign_key "watches", "boats"
  add_foreign_key "watches", "courses"
  add_foreign_key "watches", "trips"
end
