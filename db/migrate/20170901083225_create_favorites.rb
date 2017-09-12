class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.string :name
      t.integer :count_view, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
