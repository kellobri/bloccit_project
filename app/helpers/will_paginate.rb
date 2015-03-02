module WillPaginate 

	def paginate(hash)
		per_page = hash[:per_page]
		#pg ||= 1

		pages = (Topic.all.count.to_f/per_page).ceil
		arpgs = (1..pages).to_a
		#params[:page] = arpgs

		pgcollect = Array.new
		pgscollect = Array.new
		arpgs.each do |pgs|
			Topic.limit(per_page).offset((pgs-1)*per_page) do |group|
				group.page = pgs	
				pgcollect << group	
			end
			pgscollect << pgcollect
		end
		return pgscollect
	end

end