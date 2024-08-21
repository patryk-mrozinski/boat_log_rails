# == Schema Information
#
# Table name: sails
#
#  id         :uuid             not null, primary key
#  area       :float            not null
#  marks      :string
#  type_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  boat_id    :uuid
#
# Indexes
#
#  index_sails_on_boat_id  (boat_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#
class Sail < ApplicationRecord
  belongs_to :boat

  validates_presence_of :type_name, :area

  enum :type_name, head_sail: 'head_sail', main_sail: 'head_sail', genoa: 'genoa', spinnaker: 'spinnaker'
end
