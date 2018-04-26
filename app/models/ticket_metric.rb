class TicketMetric < ApplicationRecord
	serialize :first_resolution_time_in_minutes
	serialize :full_resolution_time_in_minutes
	serialize :reply_time_in_minutes

	
	
end
