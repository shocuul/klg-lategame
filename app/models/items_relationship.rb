class ItemsRelationship < ActiveRecord::Base
	belongs_to :item_up, class_name: "Item"
	belongs_to :item_down, class_name: "Item"
	validates :item_up_id, presence: true
	validates :item_down_id, presence: true 
end
