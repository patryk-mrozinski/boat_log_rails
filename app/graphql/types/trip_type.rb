# frozen_string_literal: true

module Types
  class TripType < Types::BaseObject
    field :id, ID, null: false
    field :departure_time, GraphQL::Types::ISO8601DateTime, null: false
    field :departure_location, String, null: false
    field :arriving_time, GraphQL::Types::ISO8601DateTime
    field :arriving_location, String
    field :estimated_arriving_location, String
    field :estimated_arriving_time, GraphQL::Types::ISO8601DateTime
    field :status, String
    field :boat_id, Types::UuidType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
