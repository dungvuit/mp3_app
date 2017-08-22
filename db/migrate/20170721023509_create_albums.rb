class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :picture
      t.integer :count_view, default: 0
      t.integer :singer_id
      t.timestamps
    end
  end
end
