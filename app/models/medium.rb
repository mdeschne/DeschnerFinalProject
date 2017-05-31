# == Schema Information
#
# Table name: media
#
#  id         :integer          not null, primary key
#  media_url  :string
#  ups        :integer
#  downs      :integer
#  user_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Medium < ApplicationRecord

validates :user_id, :presence => true
validates :title, :presence => true
validates :media_url, :presence => true
# validates :media_url, :presence => true

has_many :playlists, :through => :adds
has_many :favorites

  belongs_to(:user, class_name: "User", foreign_key: "user_id")

end
