class User < ApplicationRecord

	
	

=begin 
def self.save_data_from_api
	uri = URI.parse("https://aprtechsupport.zendesk.com/api/v2/users.json")
	request = Net::HTTP::Get.new(uri)
	request.basic_auth("cbradford@apr.com", "cstyle32")
	request.content_type = "application/json"

	req_options = {
  	use_ssl: uri.scheme == "https",
	}

	response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  	http.request(request)
	end

	info = response.body
	user_data = JSON.parse(info)

	puts user_data
	
	users = user_data.map do |line|
		u = User.new
		u.zendesk_id = line['users']['id']
		u.save
		u
	end


end
=end

end
