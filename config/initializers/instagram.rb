require "instagram"

# CALLBACK_URL = "http://localhost:3000/oauth/callback"

Instagram.configure do | config |
  config.client_id = ENV['INSTAGRAM_CLIENT_ID']
  config.access_token = ENV['INSTAGRAM_ACCESS_TOKEN']
end
