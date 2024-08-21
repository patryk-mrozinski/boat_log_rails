# frozen_string_literal: true

module Types
  class DailySummaryType < Types::BaseObject
    field :id, Types::UuidType, null: false
    field :time_on_sails, Integer, null: false
    field :time_on_engine, Integer, null: false
    field :time_position_lights_on, GraphQL::Types::ISO8601DateTime
    field :time_position_lights_off, GraphQL::Types::ISO8601DateTime
    field :standstill_time, Integer
    field :description, String
    field :boat_id, Types::UuidType
    field :trip_id, Types::UuidType
    field :course_id, Types::UuidType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
