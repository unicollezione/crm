require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY'] # The "key" from step 1
  config.member_token = ENV['TRELLO_MEMBER_TOKEN'] # The token from step 2.
  config.oauth_token = 'f84381c572fa423f5cfc5b0a053d12d8'
  config.oauth_token_secret = '6598d278fbf153a01c0ac50ddbea7cd1411c00635130bd129bd5143bf10526b4'
end
