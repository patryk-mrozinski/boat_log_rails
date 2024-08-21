# == Schema Information
#
# Table name: daily_summaries
#
#  id                       :uuid             not null, primary key
#  description              :text
#  standstill_time          :integer
#  time_on_engine           :integer          not null
#  time_on_sails            :integer          not null
#  time_position_lights_off :datetime
#  time_position_lights_on  :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  boat_id                  :uuid
#  course_id                :uuid
#  trip_id                  :uuid
#
# Indexes
#
#  index_daily_summaries_on_boat_id    (boat_id)
#  index_daily_summaries_on_course_id  (course_id)
#  index_daily_summaries_on_trip_id    (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (trip_id => trips.id)
#
class DailySummary < ApplicationRecord
  belongs_to :boat
  belongs_to :trip
  belongs_to :course

  validates_presence_of :time_on_sails, :time_on_engine
end
