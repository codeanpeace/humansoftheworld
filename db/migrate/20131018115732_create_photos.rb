class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :fb_id
      t.string :created_time
      t.string :likes_count
      t.string :picture
      t.string :link
      t.float :latitude
      t.float :longitude
      t.references :page

      t.timestamps
    end
    add_index :photos, :page_id
  end
end
