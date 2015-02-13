module ApplicationHelper
	def page_header(text)
	  content_for(:page_header) { text.to_s }
	 
	end

	def page_desc(text)
		 content_for(:page_desc) { text.to_s }
	end
end
