require 'json'
require 'rubygems'
require 'crack'
require 'open-uri'
require 'rest-client'
require 'json'
require 'pry'

json_file = File.read('voting_record.json')

json_data = JSON.parse(json_file)

# puts jsonarray

open('bill_voting_data.SQL', 'w') { |item|
  json_data.each do |i|
    item << "INSERT INTO members (mp_id, committee_title)\n"
    item << "VALUES (#{i['mp_id'].to_i}, \'#{i['committee_title']}\');\n"
  end

}