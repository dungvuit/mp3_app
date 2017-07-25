class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :ownerable_id
      t.string :ownerable_type

      t.timestamps
    end
  end
end
