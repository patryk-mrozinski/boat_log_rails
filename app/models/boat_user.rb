# == Schema Information
#
# Table name: boat_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  boat_id    :uuid
#  user_id    :uuid
#
# Indexes
#
#  index_boat_users_on_boat_id  (boat_id)
#  index_boat_users_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#  fk_rails_...  (user_id => users.id)
#
class BoatUser < ApplicationRecord
  belongs_to :boat
  belongs_to :user
end
