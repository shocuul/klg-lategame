class Item < ActiveRecord::Base
	#attr_accessible :image
	has_attached_file :image,
		:storage => :dropbox,
		:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		:dropbox_options => {:path => "items/:id_:filename"}
end
