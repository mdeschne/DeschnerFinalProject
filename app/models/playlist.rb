# == Schema Information
#
# Table name: playlists
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Playlist < ApplicationRecord
validates :user_id, :presence => true
validates  :title, :presence => true
has_many :media, :through => :adds
  belongs_to(:user, class_name: "User", foreign_key: "user_id")

end
