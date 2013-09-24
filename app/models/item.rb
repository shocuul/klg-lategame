##########################################################
#  Creator:  Jose David Pacheco Valedo
#
##########################################################
class Item < ActiveRecord::Base
	#attr_accessible :image
	has_many :items_relationships, foreign_key: "item_up_id"
	has_many :reverse_items_relationships, foreign_key: "item_down_id", class_name: "ItemsRelationship"

	has_many :items_up, through: :items_relationships, source: :item_up
	has_many :items_down, through: :reverse_items_relationships, source: :item_down

	validates :image, :attachment_presence => true
	has_attached_file :image


	def relation?(other_item)
		items_relationships.find_by(item_up_id: other_item.id)
	end

	def createrelation!(other_item)
		items_relationships.create!(item_down_id: self.id, item_up_id: other_item.id)
	end

	def destroyrelation!(other_item)
		items_relationships.find_by(item_up_id: other_item.id).destroy!
	end
end
