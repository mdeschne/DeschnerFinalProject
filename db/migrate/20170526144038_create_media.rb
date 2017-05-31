class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.string :media_url
      t.integer :ups
      t.integer :downs
      t.integer :user_id
      t.string :title

      t.timestamps

    end
  end
end
