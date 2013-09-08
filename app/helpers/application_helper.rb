module ApplicationHelper
	#return the full titple on a per-page basic
	def full_title(page_title)
		base_title = "LateGame Latinoamerica"
		if page_title.empty?
			base_title
		else
			"#{base_title} - #{page_title}"
		end
	end
end
