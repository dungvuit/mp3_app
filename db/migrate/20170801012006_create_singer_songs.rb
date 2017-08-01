class CreateSingerSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :singer_songs do |t|
      t.references :song, foreign_key: true
      t.references :singer, foreign_key: true
      t.timestamps
    end
  end
end
