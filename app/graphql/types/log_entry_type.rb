# frozen_string_literal: true

module Types
  class LogEntryType < Types::BaseObject
    field :id, Types::UuidType, null: false
    field :course_angle, Integer, null: false
    field :see_condition, String, null: false
    field :boat_speed, Float, null: false
    field :compass_heading, Integer
    field :declination, String
    field :deviation, String
    field :wind_correction, String
    field :sea_current_correction, String
    field :log_indication, String
    field :used_sails_mark, String
    field :used_engine_information, String
    field :wind_power, String
    field :clouds_and_rain, String
    field :barometric_pressure, Integer
    field :temperature, Integer
    field :visibility, String
    field :boat_id, Types::UuidType
    field :trip_id, Types::UuidType
    field :course_id, Types::UuidType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
