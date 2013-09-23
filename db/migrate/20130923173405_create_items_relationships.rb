class CreateItemsRelationships < ActiveRecord::Migration
  def change
    create_table :items_relationships do |t|
      t.integer :item_up_id
      t.integer :item_down_id

      t.timestamps
    end
    add_index :items_relationships, :item_up_id
    add_index :items_relationships, :item_down_id
    add_index :items_relationships, [:item_up_id, :item_down_id], unique: true
  end
end
