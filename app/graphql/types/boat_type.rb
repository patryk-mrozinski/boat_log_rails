# frozen_string_literal: true

module Types
  class BoatType < Types::BaseObject
    field :id, Types::UuidType, null: false
    field :length, Float, null: false
    field :width, Float, null: false
    field :max_draft, Float, null: false
    field :type_name, String, null: false
    field :home_port, String, null: false
    field :name, String, null: false
    field :registration, String, null: false
    field :sails_area, Float
    field :mast_height, Float
    field :owner_id, Types::UuidType
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # associations
    field :trips, [Types::TripType]
    field :log_entries, [Types::LogEntryType]
    field :watches, [Types::WatchType]
    field :sails, [Types::SailType]
    field :engines, [Types::EngineType]
    field :daily_summaries, [Types::DailySummaryType]
    field :courses, [Types::CourseType]
  end
end
