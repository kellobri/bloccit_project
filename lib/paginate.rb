module WillPaginate 

	def paginate(page, per_page)
		pages = (@topics.all.count/per_page.to_f).ceil
		arpgs = (1..pages).to_a

		pgcollect = Array.new
		argps.each do |p|
			pgcont = {}
			pgcont["page"] = p
			pgcont["content"] = Topic.limit(per_page).offset(p*per_page)
			pgcollect << pgcont
		end

		return pgcollect
	end

end