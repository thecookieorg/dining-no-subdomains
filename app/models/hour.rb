class Hour < ActiveRecord::Base
	belongs_to :merchant
	belongs_to :location_hour
end
