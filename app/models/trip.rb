# == Schema Information
#
# Table name: trips
#
#  id                          :uuid             not null, primary key
#  arriving_location           :string
#  arriving_time               :datetime
#  departure_location          :string           not null
#  departure_time              :datetime         not null
#  estimated_arriving_location :string
#  estimated_arriving_time     :datetime
#  status                      :string           default("draft")
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  boat_id                     :uuid
#
# Indexes
#
#  index_trips_on_boat_id  (boat_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#
class Trip < ApplicationRecord
  belongs_to :boat

  has_many :courses
  has_many :daily_summaries
  has_many :log_entries
  has_many :watches

  validates_presence_of :departure_time, :departure_location

  enum :status, draft: 'draft', in_progress: 'in_progress', finished: 'finished'
end
