require "rubygems"
require "bundler"
Bundler.setup

require 'open-uri'
require 'nokogiri'

Dir["./lib/*.rb"].each {|file| require file }

require 'twitter'
Twitter.configure do |config|
  config.consumer_key = "zIX22R2CjcL2mrVvQHv8aA"
  config.consumer_secret = "Sr9cVxXJ6dl7If5vbSMVKzyRziFYRWIcRN1XHmI6U"
  config.oauth_token = "57512224-53GKsI7HtEvQf6604MXEXAj1SogxvGfeceWr4oWEY"
  config.oauth_token_secret = "K38pUbZfbdw6C2JfYbsSEIdieX65s0eDHg3tcA6wb8"
end

require 'redis'
$redis = Redis.new(:host => 'localhost', :port => 6379)

require 'htmlentities'
$coder = HTMLEntities.new

require 'term/ansicolor'
class String
  include Term::ANSIColor
end