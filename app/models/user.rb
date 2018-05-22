class User < ApplicationRecord

	def self.to_csv
    attributes = %w{id zen_id name email}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.value_at(*attributes)
      end
    end
  end

		

end
