require 'twitter'
require 'pry'
require 'json'
require 'rubygems'
require 'open-uri'
require 'rest-client'
require 'json'
require 'pry'


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "b1HRb0wLGXLT1ZJNSHuhJA5ce"
  config.consumer_secret     = "2bZAqKlyGhjW6FU3EOLmFIMpo1ajpnrgy0XGv4YhqnNwv2z2Bh"
  config.access_token        = "444219990-U2IYBdYC4W6N4tQuNgl49eXWrLXIWBAioXB7hwOC"
  config.access_token_secret = "U2RpWh0zYboBJQS1lI0oy6KlOFvOA8e2n5JHuJEs34VID"
end
