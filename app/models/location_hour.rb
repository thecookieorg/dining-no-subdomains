class LocationHour < ActiveRecord::Base
	belongs_to :location
	belongs_to :merchant

	has_many :hours, dependent: :destroy
	accepts_nested_attributes_for :hours, allow_destroy: true

	def hours_form_for
		collection = hours.where(location_hour_id: id)
		collection.any? ? collection : hours.build
	end
end
