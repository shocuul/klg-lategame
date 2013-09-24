##########################################################
#  Creator:  Jose David Pacheco Valedo
#
##########################################################
class Item < ActiveRecord::Base
	
	has_many :items_relationships, foreign_key: "downgrade_id", dependent: :destroy
	has_many :upgrades, through: :items_relationships, source: :upgrade


	has_many :reverse_items_relationships, foreign_key: "upgrade_id",
										   class_name: "ItemsRelationship",
										   dependent: :destroy

	has_many :downgrades, through: :reverse_items_relationships, source: :downgrade



	validates :image, :attachment_presence => true
	has_attached_file :image

	def anyupgrade?(other_item)
		items_relationships.find_by(upgrade_id: other_item.id)
	end

	def makeupgrade!(other_item)
		items_relationships.create!(upgrade_id: other_item.id)
	end

	def destroyupgrade(other_item)
		items_relationships.find_by(upgrade_id: other_item.id).destroy!
	end
	

end

