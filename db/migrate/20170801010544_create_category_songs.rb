class CreateCategorySongs < ActiveRecord::Migration[5.0]
  def change
    create_table :category_songs do |t|
      t.references :song, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
