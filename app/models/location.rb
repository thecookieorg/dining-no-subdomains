class Location < ActiveRecord::Base
	belongs_to :merchant
	has_many :locationscategory
	has_many :categories, through: :locationscategory

	geocoded_by :address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates

	has_many :location_hours
end
