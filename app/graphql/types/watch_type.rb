# frozen_string_literal: true

module Types
  class WatchType < Types::BaseObject
    field :id, ID, null: false
    field :start_time, GraphQL::Types::ISO8601DateTime, null: false
    field :end_time, GraphQL::Types::ISO8601DateTime
    field :number, String
    field :boat_id, Types::UuidType
    field :trip_id, Types::UuidType
    field :course_id, Types::UuidType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
