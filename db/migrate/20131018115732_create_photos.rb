class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :fb_id
      t.string :created_time
      t.integer :likes
      t.string :picture
      t.string :link
      t.float :latitude
      t.float :longitude
      t.integer :shares
      t.text :message
      t.references :page

      t.timestamps
    end
    add_index :photos, :page_id
  end
end
