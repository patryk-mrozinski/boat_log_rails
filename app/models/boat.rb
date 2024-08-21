# == Schema Information
#
# Table name: boats
#
#  id           :uuid             not null, primary key
#  home_port    :string           not null
#  length       :float            not null
#  mast_height  :float
#  max_draft    :float            not null
#  name         :string           not null
#  registration :string           not null
#  sails_area   :float
#  type_name    :string           not null
#  width        :float            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :uuid
#
# Indexes
#
#  index_boats_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Boat < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  has_many :boat_users
  has_many :skippers, through: :boat_users, source: :user

  has_many :trips
  has_many :log_entries
  has_many :watches
  has_many :sails
  has_many :engines
  has_many :daily_summaries
  has_many :courses

  validates_presence_of :length, :width, :max_draft, :type_name, :home_port, :name, :registration
end
