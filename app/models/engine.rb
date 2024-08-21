# == Schema Information
#
# Table name: engines
#
#  id         :bigint           not null, primary key
#  brand      :string           not null
#  power      :integer          not null
#  type_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  boat_id    :uuid
#
# Indexes
#
#  index_engines_on_boat_id  (boat_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#
class Engine < ApplicationRecord
  belongs_to :boat

  validates_presence_of :type_name, :power, :brand

  enum :type_name, outboard: 'outboard', inboard: 'inboard', sterndrive: 'sterndrive', jet_drive: 'jet_drive'
end
