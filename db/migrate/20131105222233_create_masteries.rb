class CreateMasteries < ActiveRecord::Migration
  def change
    create_table :masteries do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_attachment :masteries, :image
  end
end
