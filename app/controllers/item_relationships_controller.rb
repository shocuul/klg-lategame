class ItemRelationshipsController < ApplicationController
	
	def create
		@upgradeitem = Item.find(params[:item_relationship][:upgrade_id])
		@downgradeitem = Item.find(params[:item_relationship][:downgrade_id])
		@downgradeitem.makeupgrade!(@upgradeitem)
		redirect_to relationships_item_path(@downgradeitem)
	end
	def destroy
		@upgrade = Item.find(params[:upgrade_id])
		@downgrade = Item.find(params[:id])
		@downgrade.destroyupgrade(@upgrade)
		redirect_to relationships_item_path(@downgradeitem)
	end
end