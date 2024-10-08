# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  boat_owner      :boolean          default(FALSE)
#  email           :citext           not null
#  first_name      :citext           not null
#  last_name       :citext           not null
#  password_digest :string           not null
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :owned_boats, class_name: 'Boat', foreign_key: :owner_id

  has_many :boat_users
  has_many :chartered_boats, through: :boat_users, source: :boat

  validates_presence_of :first_name, :last_name, :email

  enum :role, crew_member: 'crew_member', first_officer: 'first_officer', captain: 'captain'
end
