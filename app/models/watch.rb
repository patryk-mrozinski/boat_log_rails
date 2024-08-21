# == Schema Information
#
# Table name: watches
#
#  id         :uuid             not null, primary key
#  end_time   :datetime
#  number     :string
#  start_time :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  boat_id    :uuid
#  course_id  :uuid
#  trip_id    :uuid
#
# Indexes
#
#  index_watches_on_boat_id    (boat_id)
#  index_watches_on_course_id  (course_id)
#  index_watches_on_trip_id    (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (trip_id => trips.id)
#
class Watch < ApplicationRecord
  belongs_to :boat
  belongs_to :trip
  belongs_to :course

  validates_presence_of :start_time
end
