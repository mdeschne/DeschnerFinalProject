class CreateAdds < ActiveRecord::Migration[5.0]
  def change
    create_table :adds do |t|
      t.integer :media_id
      t.integer :playlist_id

      t.timestamps

    end
  end
end
