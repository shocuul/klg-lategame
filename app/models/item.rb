class Item < ActiveRecord::Base
	#attr_accessible :image
	validates :image, :attachment_presence => true
	has_attached_file :image

end
