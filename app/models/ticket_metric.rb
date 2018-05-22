class TicketMetric < ApplicationRecord
	serialize :first_resolution_time_in_minutes
	serialize :full_resolution_time_in_minutes
	serialize :reply_time_in_minutes

	def self.to_csv
    attributes = %w{id zen_id}

    CSV.generate(headers: true) do |csv|
      csv << attributes

       all.each do |ticket_metric|
        csv << attributes.map{ |attr| ticket_metric.send(attr) }
      end
    end
  end
	
	
end
