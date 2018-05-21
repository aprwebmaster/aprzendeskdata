
require 'json'


file2 = File.read('aprzendesktickets.json')

tickets = JSON.load(file2)['tickets']

hold = []

tickets.where(assignee_id = 2661956646) do |a|
  hold << a 
end 

File.write('edgartickets.json', hold)



	