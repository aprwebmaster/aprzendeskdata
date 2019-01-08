require 'net/http'
require 'uri'
require 'csv'
require 'json'

uri = URI.parse("https://aprtechsupport.zendesk.com/api/v2/users.json")
request = Net::HTTP::Get.new(uri)
request.basic_auth("cbradford@apr.com", "cstyle32")

req_options = {
  use_ssl: uri.scheme == "https",
}

@response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

# response.code
# response.body


puts @response.message
puts @response.body


File.write('aprzendeskusers1.json', @response.body)

file = File.read('aprzendeskusers1.json')
hash = JSON.parse(file)

CSV.open('aprzendeskusers.csv', 'w') do |csv|
  headers = hash.first.keys
  csv << headers

  hash.each do |item|
    values = item.values
    printable_values = Array.new
    values.each do |value|

      printable_values << value.to_s.gsub(/\[|\]/,'').gsub(/"/,'\'')

    end

    csv << printable_values

  end

end