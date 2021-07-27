class AbstractQuery 
	def initialize(args)
		@args = args
	end

	def notion_query
		req = NotionApi.new(NotionQuery.orders(@args))		
	end
	
end
