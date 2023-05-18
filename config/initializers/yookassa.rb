Yookassa.configure do |config|
  config.shop_id = ENV.fetch('YOOKASSA_SHOP_ID')
  config.api_key = ENV.fetch('YOOKASSA_API_KEY')
end
