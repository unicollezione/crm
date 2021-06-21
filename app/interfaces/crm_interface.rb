require 'faraday'



 def post_con
   conn = Faraday.new do |f|
     f.request :json 
     f.request :retry 
     f.response :follow_redirects 
     f.response :json
   end
   resp = conn.post('https://api.notion.com/v1/databases/YbFXocoEnikiHUqbg4WKepa3h9gfhodYAJFW94UZ5HQ/query' ) do |r|
   	 r.body = {query: '987'}
   end
 end
