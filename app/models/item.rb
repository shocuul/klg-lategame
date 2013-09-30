##########################################################
#  Creator:  Jose David Pacheco Valedo
#
##########################################################
class Item < ActiveRecord::Base
	
	has_many :item_relationships, foreign_key: "downgrade_id", dependent: :destroy
	has_many :upgrade_items, through: :item_relationships, source: :upgrade

	has_many :reverse_item_relationships, foreign_key: "upgrade_id",
										  class_name: "ItemRelationship",
										  dependent:  :destroy
	has_many :downgrade_items, through: :reverse_item_relationships, source: :downgrade

	validates :name , :price, :description, presence: true
	validates :image, :attachment_presence => true
	has_attached_file :image

	def anyupgrade?(other_item)
		item_relationships.find_by(upgrade_id: other_item.id)
	end

	def anydowngrade?(other_item)
		item_relationships.find_by(downgrade_id: other_item.id)
	end

	def makeupgrade!(other_item)
		item_relationships.create!(upgrade_id: other_item.id)
	end

	def destroyupgrade(other_item)
		item_relationships.find_by(upgrade_id: other_item.id).destroy!
	end
	

end
