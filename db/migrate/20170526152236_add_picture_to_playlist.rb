class AddPictureToPlaylist < ActiveRecord::Migration[5.0]
  def change
    add_column :playlists, :picture, :string

  end
end
