require 'twitter'
require 'pry'
require 'json'
require 'rest-client'
require 'json'
require 'pry'


# require_relative 'score_engagement.rb'



@client = Twitter::REST::Client.new do |config|
  # config.consumer_key        = "b1HRb0wLGXLT1ZJNSHuhJA5ce"
  # config.consumer_secret     = "2bZAqKlyGhjW6FU3EOLmFIMpo1ajpnrgy0XGv4YhqnNwv2z2Bh"
  # config.access_token        = "444219990-U2IYBdYC4W6N4tQuNgl49eXWrLXIWBAioXB7hwOC"
  # config.access_token_secret = "U2RpWh0zYboBJQS1lI0oy6KlOFvOA8e2n5JHuJEs34VID"
  config.consumer_key        = "E6ut0P8Bdig8RsvWByomuUiSQ"
  config.consumer_secret     = "vvt9JY7B3tyf8PwE2vChADKW0sT553hiL9Z5gHTqbClp13MOd8"
  config.access_token        = "1571155201-DGxRsqhbE43Y0NSTSgJv4ljL3mEorIMB12xDHit"
  config.access_token_secret = "lRFb792fOQB8ERT9ND0xLruqL0nKPKsFGXoaXQ3l9inDJ"
end

json_file = File.read('open_parliament.json')
json_data = JSON.parse(json_file)



twitter = []
data = []

# json_data.each do |i|

#   twitter.push(i['handle'])

# test = client.user_timeline(i['handle'])
# end


json_data.each do |mp|
  begin
    # puts twitter 
  # if mp['twitter_handle'].length > 
    @client.user_timeline(mp['twitter_handle'], {count: 25}).each do |tweet|
      data.push({
        "text": tweet.text,
        "quoted_status": {text: tweet.quoted_status.text}  
      })
    # end
  end
  rescue Twitter::Error::TooManyRequests => error
  # rescue Twitter::Error::NotFound => error
    sleep error.rate_limit.reset_in + 1
    rescue => e
      puts "Rescue : #{e}"
    rescue Timeout::Error => te
     puts "Rescued from timeout : #{te}"
  end
end

File.open("tweets2.json","w") do |f|
  f.write(data.to_json)
end


# if tweet.text[0] == '@' || tweet.text[0] == '.' && tweet.text[1] == '@'
#   partcipation_count += 1
# elsif not tweet.quoted_status.text.nil?
#   partcipation_count += 1

