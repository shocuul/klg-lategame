class ItemRelationship < ActiveRecord::Base
	belongs_to :upgrade, class_name: "Item"
	belongs_to :downgrade, class_name: "Item"

	validates :upgrade_id, presence: true
	validates :downgrade_id, presence: true
end
