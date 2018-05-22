class Ticket < ApplicationRecord
	scope :recents, -> { uncached { where("created_at > ?", Time.now - 7.days) }}

	def self.to_csv
    attributes = %w{id zen_id}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |ticket|
        csv << attributes.value_at(*attributes)
      end
    end
  end
	
end
