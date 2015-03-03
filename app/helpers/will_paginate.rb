module WillPaginate 

	include ActionView::Helpers::UrlHelper

	def paginate(options = {})

		per_page = options[:per_page] || 10
		@pg = options[:page] || 0

		@pgs = (Topic.all.count/per_page.to_f).ceil
		content = Topic.limit(per_page).offset(@pg.to_i*per_page)

		viewhash = { :page => @pg, :pages => @pgs, :content => content}

		#will_paginate(viewhash)
		return viewhash[:content]
	end

end

def view_paginate(justtopics)
	
	nextpg = @pg.to_i + 1
	prevpg = @pg.to_i - 1

	totpgs = @pgs.to_i

	if nextpg < totpgs 
		nextlink = '<a href="/topics?page='+nextpg.to_s+'">Next Page</a>' 
	else
		nextlink = ''
	end

	if prevpg > -1
		prevlink = '<a href="/topics?page='+prevpg.to_s+'">Previous Page</a>'
	else
		prevlink = ''
	end

	navigate = '<br/><p>'+prevlink+'...'+nextlink+'</p>'
	navigate.html_safe
end