# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  media_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ApplicationRecord
validates :user_id, :presence => true
validates :media_id, :presence => true
  belongs_to(:user, class_name: "User", foreign_key: "user_id")
  belongs_to(:medium, class_name: "Medium", foreign_key: "media_id")
end
