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

#this script imports APR user data from the zendesk api and populates the database with it. 


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

#info.to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')

#result = JSON.parse(info, :symbolize_names => true)


info.force_encoding("utf-8")

File.write('aprzendeskusers1.json', info)


puts "File Created Successfully!"

file = File.read('aprzendeskusers1.json')

users = JSON.load(file)['users']

users.each do |a|
	User.find_or_create_by(:zendesk_id => a['id'], :url => a['url'], :name => a['name'], :email => a['email'],
		:phone => a['phone'], :role => a['role']
		)
end

=begin

data = []

	file.each_line do |user|
		
		object = {
			"id": user["zendesk_id"],
			"url": user["url"],
			"name": user["name"],
			"email": user["email"],
			"created_at": user["created_at"],
			"updated_at": user["updated_at"],
			"time_zone": user["time_zone"],
			"phone": user["phone"],
			"shared_phone_number": user["shared_phone_number"],
			"locale_id": user["locale_id"],
			"locale": user["locale"],
			"organization_id": user["organization_id"],
			"role": user["role"],
			"verified": user["verified"],
			"external_id": user["external_id"],
			"tags": user["tags"],
			"alias": user["alias"],
			"active": user["active"],
			"shared": user["shared"],
			"shared_agent": user["shared_agent"],
			"last_login_at": user["last_login_at"],
			"two_factor_auth_enabled": user["two_factor_auth_enabled"],
			"signature": user["signature"],
			"details": user["details"],
			"notes": user["notes"],
			"role_type": user["role_type"],
			"custom_role_id": user["custom_role_id"],
			"moderator": user["moderator"],
			"ticket_restriction": user["ticket_restriction"],
			"only_private_comments": user["only_private_comments"],
			"restricted_agent": user["restricted_agent"],
			"suspended": user["suspended"],
			"chat_only": user["chat_only"],
			"default_group_id": user["default_group_id"],
			"user_fields": user["user_fields"]

		}

		data << object
	end
User.create!(data)
=end
puts "Seed Finished"
puts "#{User.count} users created"


