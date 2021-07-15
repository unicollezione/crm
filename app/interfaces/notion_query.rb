require 'notion_api'

class NotionQuery < AbstractQuery 

	def find_notion_query

	 @client = NotionAPI::Client.new("ENV['NOTION_API_TOKEN']")

	
		query = NotionQuery.find(query{order(id: args)})
	end
end
