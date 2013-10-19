class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :fb_id
      t.text :description
      t.text :about
      t.integer :talking_about_count
      t.string :link
      t.integer :likes
      t.string :cover_source
      t.string :place
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
