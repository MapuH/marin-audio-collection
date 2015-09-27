class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :year
      t.integer :cd_number
      t.string :genre
      t.integer :tracks_num
      t.string :label
      t.string :image
      t.string :listen

      t.timestamps null: false
    end
  end
end
