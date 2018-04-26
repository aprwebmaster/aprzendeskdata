class Ticket < ApplicationRecord
	scope :recents, -> { uncached { where("created_at > ?", Time.now - 7.days) }}
	
end
