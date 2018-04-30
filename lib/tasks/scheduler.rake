desc "This task is called by the Heroku scheduler add-on. It will make calls to the Zendesk API, seed the database, and update information"
task :update_data => :environment do
  puts "Updating data..."
  rake db:seed 
  puts "done."
end
