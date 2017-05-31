# == Schema Information
#
# Table name: adds
#
#  id          :integer          not null, primary key
#  media_id    :integer
#  playlist_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Add < ApplicationRecord

  validates :media_id, :presence => true
  validates :playlist_id, :presence => true

  belongs_to :media
  belongs_to :playlists
end
