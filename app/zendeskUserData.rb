require 'httparty'
require 'json'
require 'csv'

#pulling data from zendesk API into txt file

@response = HTTParty.get('https://aprtechsupport.zendesk.comn/api/v2/users.json')

puts @response.body
puts @response.message


File.write('aprzendeskusers.txt', @response.body)