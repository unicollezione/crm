class NotionQuery < AbstractQuery 

	def find_notion_query

	 client = NotionAPI::Client.new("ENV['NOTION_API_TOKEN']")

	 client_query = NotionQuery.find_by(id: client.id)
	end
end
