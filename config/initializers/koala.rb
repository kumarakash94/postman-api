# In Rails, you could put this in config/initializers/koala.rb
Koala.configure do |config|
  # config.access_token = MY_TOKEN
  # config.app_access_token = MY_APP_ACCESS_TOKEN
  config.app_id = "418830859605438"
  config.app_secret = "7811c29abf4866541862fbbe20828cfa"
  # See Koala::Configuration for more options, including details on how to send requests through
  # your own proxy servers.
end
