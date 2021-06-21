require 'faraday'

class NotionFaraday

  def post_conn(find_notion_query)  

    url = 'https://api.notion.com/v1/databases/a7627918c5194a14a85806fc02898bf2'

    conn = Faraday.new do |f|
      f.request :json 
      f.request :retry 
      f.response :follow_redirects 
      f.response :json
    end

    post_request = conn.post( url ) do |r|
    	r.body = {query}
    end
  end	
end
