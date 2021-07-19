# frozen_string_literal: true

require 'faraday'
class NotionFaraday
  def get_conn(_find_notion_query)
    url = 'https://api.notion.com/v1/databases/a7627918c5194a14a85806fc02898bf2'

    conn = Faraday.new do |f|
      f.request :json
      f.request :retry
      f.response :follow_redirects
      f.response :json
    end

    get_request = conn.get(url, {}, Authorization: ENV['NOTION_API_TOKEN'],
                                    'Content-Type' => 'application/json',
                                    'Notion-Version' => '2021-05-13')
    get_request.body[]
  end
end
