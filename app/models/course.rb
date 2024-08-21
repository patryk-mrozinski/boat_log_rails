# == Schema Information
#
# Table name: courses
#
#  id                 :uuid             not null, primary key
#  arriving_location  :string
#  arriving_time      :datetime
#  comments           :text
#  departure_location :string           not null
#  departure_time     :datetime         not null
#  sailing_number     :string
#  sailing_type       :string
#  stopover_in        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  boat_id            :uuid
#  trip_id            :uuid
#
# Indexes
#
#  index_courses_on_boat_id  (boat_id)
#  index_courses_on_trip_id  (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#  fk_rails_...  (trip_id => trips.id)
#
class Course < ApplicationRecord
  belongs_to :trip
  belongs_to :boat

  has_many :log_entries
  has_many :watches
  has_many :daily_summaries

  validates_presence_of :departure_time, :departure_location
end
