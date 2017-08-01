class CreateSingers < ActiveRecord::Migration[5.0]
  def change
    create_table :singers do |t|
      t.string :name
      t.string :picture
      t.date :dob
      t.integer :gender, null: false, default: 0
      t.string :address

      t.timestamps
    end
  end
end
