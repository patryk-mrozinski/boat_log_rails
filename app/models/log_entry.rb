# == Schema Information
#
# Table name: log_entries
#
#  id                      :uuid             not null, primary key
#  barometric_pressure     :integer
#  boat_speed              :float            not null
#  clouds_and_rain         :string
#  compass_heading         :integer
#  course_angle            :integer          not null
#  declination             :string
#  deviation               :string
#  log_indication          :string
#  sea_current_correction  :string
#  see_condition           :string           not null
#  temperature             :integer
#  used_engine_information :string
#  used_sails_mark         :string
#  visibility              :string
#  wind_correction         :string
#  wind_power              :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  boat_id                 :uuid
#  course_id               :uuid
#  trip_id                 :uuid
#
# Indexes
#
#  index_log_entries_on_boat_id    (boat_id)
#  index_log_entries_on_course_id  (course_id)
#  index_log_entries_on_trip_id    (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (trip_id => trips.id)
#
class LogEntry < ApplicationRecord
  belongs_to :boat
  belongs_to :trip
  belongs_to :course

  validates_presence_of :course_angle, :see_condition, :boat_speed

  validates :course_angle, numericality: { less_than_or_equal_to: 359,  only_integer: true }
end
