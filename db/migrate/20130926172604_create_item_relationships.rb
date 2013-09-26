class CreateItemRelationships < ActiveRecord::Migration
  def change
    create_table :item_relationships do |t|
      t.integer :upgrade_id
      t.integer :downgrade_id

      t.timestamps
    end
    add_index :item_relationships, :upgrade_id
    add_index :item_relationships, :downgrade_id
    add_index :item_relationships, [:upgrade_id, :downgrade_id], unique: true
   end
end
