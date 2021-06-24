class FindNotionQuery

	def find_notion_query
		query = NotionQuery.find(query{order(id: args)})
	end
end
