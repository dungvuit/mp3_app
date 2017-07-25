class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :url_song
      t.string :picture
      t.string :content
      t.timestamps
    end
  end
end
