# frozen_string_literal: true

module Types
  class EngineType < Types::BaseObject
    field :id, Types::UuidType, null: false
    field :type_name, String, null: false
    field :power, Integer, null: false
    field :brand, String, null: false
    field :boat_id, Types::UuidType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
