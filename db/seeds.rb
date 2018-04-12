# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'uri'
require 'json'
require 'faker'


uri = URI.parse("https://aprtechsupport.zendesk.com/api/v2/users.json")
request = Net::HTTP::Get.new(uri)
request.content_type = "application/json"
request.basic_auth("cbradford@apr.com", "cstyle32")

req_options = {
  use_ssl: uri.scheme == "https",
}

@response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end
puts @response.body
puts @response.message
puts @response.code

info = @response.body 


info.force_encoding("utf-8")

File.write('aprzendeskusers.json', info)


puts "File Created Successfully!"

file = File.read('aprzendeskusers.json')

users = JSON.load(file)['users']

users.each do |a|
	User.find_or_create_by(:zendesk_id_int => a["id"], :url => a["url"], :name => a["name"], :email => a["email"],
		:phone => a["phone"], :role => a["role"], :default_group_id => a["default_group_id"], :external_id => a["external_id"],
		:tags => a["tags"]
		)
end
nextURL = JSON.parse(info)
while nextURL["next_page"]
 newUri = nextURL["next_page"]
 uriLoop = URI.parse(newUri)
 puts newUri
 requestLoop = Net::HTTP::Get.new(uriLoop)
 requestLoop.content_type = "application/json"
 requestLoop.basic_auth("cbradford@apr.com", "cstyle32")

 req_optionsLoop = {
   use_ssl: uriLoop.scheme == "https",
 }

 @responseLoop = Net::HTTP.start(uriLoop.hostname, uriLoop.port, req_optionsLoop) do |http|
  http.request(requestLoop)
  end
  infoLoop = @responseLoop.body
  infoLoop.force_encoding("utf-8")

  File.write('aprzendeskusers.json', infoLoop)


  puts "File Created Successfully!"

  file = File.read('aprzendeskusers.json')

  users = JSON.load(file)['users']

  users.each do |a|
	  User.find_or_create_by(:zen_id => a["id"], :url => a["url"], :name => a["name"], :email => a["email"],
		  :phone => a["phone"], :role => a["role"], :default_group_id => a["default_group_id"], :external_id => a["external_id"],
		  :tags => a["tags"]
		  	)
  end
  

  resLoop = JSON.parse(infoLoop)
  updateUri = resLoop["next_page"]
  nextURL["next_page"] = updateUri
end


#this script imports APR ticket data from the zendesk api and populates the database with it. 


uri2 = URI.parse("https://aprtechsupport.zendesk.com/api/v2/tickets.json")
request2 = Net::HTTP::Get.new(uri2)
request2.content_type = "application/json"
request2.basic_auth("cbradford@apr.com", "cstyle32")

req_options2 = {
  use_ssl: uri2.scheme == "https",
}

@response2 = Net::HTTP.start(uri2.hostname, uri2.port, req_options2) do |http|
  http.request(request2)
end
puts @response2.body
puts @response2.message
puts @response2.code

info2 = @response2.body 


info2.force_encoding("utf-8")

File.write('aprzendesktickets.json', info2)


puts "File Created Successfully!"

file2 = File.read('aprzendesktickets.json')

tickets = JSON.load(file2)['tickets']

tickets.each do |a|
	Ticket.find_or_create_by(:zen_id => a['id'], :subject => a['subject'], :description => a['description'], :status => a['status'],
		:recipient => a['recipient'], :sub_id => a['submitter_id'], :req_id => a['requester_id'], 
		:a_id => a['assignee_id'], :g_id => a['group_id'], :created_at => a['created_at'], :external_id_string => a['external_id'],
		:updated_at => a['updated_at']
		)
end

nextURL2 = JSON.parse(info2)
while nextURL2["next_page"]
 newUri2 = nextURL2["next_page"]
 uriLoop2 = URI.parse(newUri2)
 puts newUri2
 requestLoop2 = Net::HTTP::Get.new(uriLoop2)
 requestLoop2.content_type = "application/json"
 requestLoop2.basic_auth("cbradford@apr.com", "cstyle32")

 req_optionsLoop2 = {
   use_ssl: uriLoop2.scheme == "https",
 }

 @responseLoop2 = Net::HTTP.start(uriLoop2.hostname, uriLoop2.port, req_optionsLoop2) do |http|
  http.request(requestLoop2)
  end
  infoLoop2 = @responseLoop2.body
  infoLoop2.force_encoding("utf-8")

  File.write('aprzendesktickets.json', infoLoop2)


  puts "File Created Successfully!"

  file2 = File.read('aprzendesktickets.json')

  tickets = JSON.load(file2)['tickets']

  tickets.each do |a|
	Ticket.find_or_create_by(:zen_id => a['id'], :subject => a['subject'], :description => a['description'], :status => a['status'],
		:recipient => a['recipient'], :sub_id => a['submitter_id'], :req_id => a['requester_id'], 
		:a_id => a['assignee_id'], :g_id => a['group_id'], :created_at => a['created_at'], :external_id_string => a['external_id'],
		:updated_at => a['updated_at']
		)
end
  

  resLoop2 = JSON.parse(infoLoop2)
  updateUri2 = resLoop2["next_page"]
  nextURL2["next_page"] = updateUri2
end

#this script imports APR ticket-metrics data from the zendesk api and populates the database with it. 


uri3 = URI.parse("https://aprtechsupport.zendesk.com/api/v2/ticket_metrics.json")
request3 = Net::HTTP::Get.new(uri3)
request3.content_type = "application/json"
request3.basic_auth("cbradford@apr.com", "cstyle32")

req_options3 = {
  use_ssl: uri3.scheme == "https",
}

@response3 = Net::HTTP.start(uri3.hostname, uri3.port, req_options3) do |http|
  http.request(request3)
end
puts @response3.body
puts @response3.message
puts @response3.code

info3 = @response3.body 


info3.force_encoding("utf-8")

File.write('aprzendeskticketmetrics.json', info3)


puts "File Created Successfully!"

file3 = File.read('aprzendeskticketmetrics.json')

ticket_metrics = JSON.load(file3)['ticket_metrics']

ticket_metrics.each do |a|
	TicketMetric.find_or_create_by(:zen_id => a['id'], :tick_id => a['ticket_id'], :assignee_updated_at => a['assignee_updated_at'], :initially_assigned_at => a['initially_assigned_at'],
		:solved_at => a['solved_at'], :first_resolution_time_in_minutes => a['first_resolution_time'], :full_resolution_time_in_minutes => a['full_resolution_time'], :external_id_string => a['external_id'],
		:created_at => a['created_at'],
		:updated_at => a['updated_at']
		)
end

nextURL3 = JSON.parse(info3)
while nextURL3["next_page"]
 newUri3 = nextURL3["next_page"]
 uriLoop3 = URI.parse(newUri3)
 puts newUri3
 requestLoop3 = Net::HTTP::Get.new(uriLoop2)
 requestLoop3.content_type = "application/json"
 requestLoop3.basic_auth("cbradford@apr.com", "cstyle32")

 req_optionsLoop3 = {
   use_ssl: uriLoop3.scheme == "https",
 }

 @responseLoop3 = Net::HTTP.start(uriLoop3.hostname, uriLoop3.port, req_optionsLoop3) do |http|
  http.request(requestLoop3)
  end
  infoLoop3 = @responseLoop3.body
  infoLoop3.force_encoding("utf-8")

  File.write('aprzendeskticketsmetrics.json', infoLoop3)


  puts "File Created Successfully!"

  file3 = File.read('aprzendeskticketmetrics.json')

  ticket_metrics = JSON.load(file3)['ticket_metrics']

  ticket_metrics.each do |a|
	  TicketMetric.find_or_create_by(:zen_id => a['id'], :tick_id => a['ticket_id'], :assignee_updated_at => a['assignee_updated_at'], :initially_assigned_at => a['initially_assigned_at'],
	  	:solved_at => a['solved_at'], :first_resolution_time_in_minutes => a['first_resolution_time'], :full_resolution_time_in_minutes => a['full_resolution_time'], :external_id_string => a['external_id'],
		:created_at => a['created_at'],
		:updated_at => a['updated_at']
		)
  end
  

  resLoop3 = JSON.parse(infoLoop3)
  updateUri3 = resLoop3["next_page"]
  nextURL3["next_page"] = updateUri3
end


puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Ticket.count} tickets created"
puts "#{TicketMetric.count} ticket metric records created"


