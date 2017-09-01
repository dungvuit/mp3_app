class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
