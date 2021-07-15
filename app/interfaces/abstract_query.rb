require 'notion_api'

class AbstractQuery 
	def initialize(args)
		@args = args
	end

	def notion_query
		req = NotionApi.new(NotionQuery.orders(@args))
		if req != nil
			req.call		
		else
			raise NotImplementedError
		end
	end
	
end
