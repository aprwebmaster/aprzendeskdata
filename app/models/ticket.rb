class Ticket < ApplicationRecord
	scope :recents, -> { where("created_at > ?", Time.now - 7.days) }
	
	
end
